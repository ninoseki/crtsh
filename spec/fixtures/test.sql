SELECT digest(certificate.certificate, 'sha256') sha256
FROM certificate_identity, certificate
WHERE certificate.id = certificate_identity.certificate_id
AND x509_notAfter(certificate.certificate) > statement_timestamp()
AND reverse(lower(certificate_identity.name_value)) LIKE reverse(lower($1))
LIMIT 10
