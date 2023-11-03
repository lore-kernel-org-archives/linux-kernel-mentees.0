Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32666C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 18:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3F6404C5;
	Fri,  3 Nov 2023 18:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3F6404C5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amJPdAOr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NAzxMu0W4nN; Fri,  3 Nov 2023 18:23:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F29AD403B4;
	Fri,  3 Nov 2023 18:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29AD403B4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9B81C0071;
	Fri,  3 Nov 2023 18:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B60F4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A375401F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A375401F3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=amJPdAOr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whCyiwI6Ykv0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:23:20 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8174840124
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8174840124
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so19617955ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Nov 2023 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1699035800; x=1699640600;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5A0vbzbDZ8JGzCbBX0R8dKw3Pjn8oBspc4WA/6Nm9Po=;
 b=amJPdAOrkyWfPG+cqsBdMLQepEA8iu9TdIXcz8Wwna6hPaq4SVLO1IkKhRZI8WkaEJ
 +Byx0NPjpuD9NkxTck+GIm3iSfqRO2I2lu6HuMj8Jnnszm4pkDm9hSCt7mmir4zYJTQ3
 5GnTMPWEx7uXaUF6mhFwbHLaPUXqj4T04iut0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699035800; x=1699640600;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5A0vbzbDZ8JGzCbBX0R8dKw3Pjn8oBspc4WA/6Nm9Po=;
 b=a5m6zkOgiy0uy57itU5+5nVo5MCEmLrQRSIX2nSqz15JJiU72FfpU5J/GstZhKOK+p
 1St7p0Mb9jfTRr8MCaTKd5DzxVA03o1jy0ZpweOgvWGZ5upDNHnB60xEvrryST53mW2+
 V9mxOzvdamvUHpId8MCfDNEDBMVHVerOMoUfsxvwZDcM5LLJ98YJqFR5Ku4H9KDbQAk2
 XyI4AGrHftegzHpXGthO6UqwFnLCN8rexzPhc8Aza7HK+j1ksu3TdcJ7UnCP6Lcf7Vzp
 t4jsH5CiBb5HoIZxY9Ha3gFT9jDa0xpHDrl8tahrusjEXkRkR6hhToDbt0YB3QINZKft
 pxUg==
X-Gm-Message-State: AOJu0YxbfFek9jS9zBEvCwd4II3f8xrlg5LlNmA02TNiWjWuEgW61SYo
 Kn85VD/eMp0D6qEgce226yr4nw==
X-Google-Smtp-Source: AGHT+IHX9+Dpd8zIzy7faXurfs9zTrh+YHXuik3xDVER/pv6yeuapftj7FkzUH72f77X0oOgF4b+RQ==
X-Received: by 2002:a17:902:f548:b0:1cc:49e7:ee1b with SMTP id
 h8-20020a170902f54800b001cc49e7ee1bmr19311352plf.58.1699035799682; 
 Fri, 03 Nov 2023 11:23:19 -0700 (PDT)
Received: from [10.69.71.77] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170902c3c100b001cc29b5c324sm1675738plj.203.2023.11.03.11.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 11:23:17 -0700 (PDT)
Message-ID: <e3ac58b2-bb78-4364-94c0-f18c376ac132@broadcom.com>
Date: Fri, 3 Nov 2023 11:23:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Prevent out-of-bounds read/write in bcmasp_netfilt_rd and
 bcmasp_netfilt_wr
To: Greg KH <gregkh@linuxfoundation.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>
References: <DB3PR10MB6835E073F668AD24F57AE64AE8A5A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <2023110301-purist-reputable-fab7@gregkh>
In-Reply-To: <2023110301-purist-reputable-fab7@gregkh>
Cc: florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Justin Chen via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Justin Chen <justin.chen@broadcom.com>
Content-Type: multipart/mixed; boundary="===============7669740188000801705=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7669740188000801705==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000544d4906094399d3"

--000000000000544d4906094399d3
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/23 5:57 AM, Greg KH wrote:
> On Fri, Nov 03, 2023 at 05:57:48PM +0530, Yuran Pereira wrote:
>> The functions `bcmasp_netfilt_rd` and `bcmasp_netfilt_wr` both call
>> `bcmasp_netfilt_get_reg_offset` which, when it fails, returns `-EINVAL`.
>> This could lead to an out-of-bounds read or write when `rx_filter_core_rl`
>> or `rx_filter_core_wl` is called.
>>
>> This patch adds a check in both functions to return immediately if
>> `bcmasp_netfilt_get_reg_offset` fails. This prevents potential out-of-bounds read
>> or writes, and ensures that no undefined or buggy behavior would originate from
>> the failure of `bcmasp_netfilt_get_reg_offset`.
>>
>> Addresses-Coverity-IDs: 1544536 ("Out-of-bounds access")
>> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
>> ---
>>   drivers/net/ethernet/broadcom/asp2/bcmasp.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> index 29b04a274d07..8b90b761bdec 100644
>> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> @@ -227,6 +227,8 @@ static void bcmasp_netfilt_wr(struct bcmasp_priv *priv,
>>   
>>   	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
>>   						   offset);
>> +	if (reg_offset < 0)
>> +		return;
>>   
>>   	rx_filter_core_wl(priv, val, reg_offset);
>>   }
>> @@ -244,6 +246,8 @@ static u32 bcmasp_netfilt_rd(struct bcmasp_priv *priv,
>>   
>>   	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
>>   						   offset);
>> +	if (reg_offset < 0)
>> +		return 0;
> 
> Shouldn't you return an error here?
> 
> thanks
> 
> greg k-h

As long as offset is less than MAX_WAKE_FILTER_SIZE we don't need to 
worry about error checking. This is already checked before we call 
netfilt_get_reg_offset() in both cases. Instead of returning -EINVAL in 
neffilt_get_reg_offset() lets return 0. This will silence the coverity 
check. In practice we will never hit this logic.

Thanks,
Justin

--000000000000544d4906094399d3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQagYJKoZIhvcNAQcCoIIQWzCCEFcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3BMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBUkwggQxoAMCAQICDCPwEotc2kAt96Z1EDANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjM5NTBaFw0yNTA5MTAxMjM5NTBaMIGM
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFDASBgNVBAMTC0p1c3RpbiBDaGVuMScwJQYJKoZIhvcNAQkB
FhhqdXN0aW4uY2hlbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQDKX7oyRqaeT81UCy+OTzAUHJeHABD6GDVZu7IJxt8GWSGx+ebFexFz/gnRO/sgwnPzzrC2DwM1
kaDgYe+pI1lMzUZvAB5DfS1qXKNGoeeNv7FoNFlv3iD4bvOykX/K/voKtjS3QNs0EDnwkvETUWWu
yiXtMiGENBBJcbGirKuFTT3U/2iPoSL5OeMSEqKLdkNTT9O79KN+Rf7Zi4Duz0LUqqpz9hZl4zGc
NhTY3E+cXCB11wty89QStajwXdhGJTYEvUgvsq1h8CwJj9w/38ldAQf5WjhPmApYeJR2ewFrBMCM
4lHkdRJ6TDc9nXoEkypUfjJkJHe7Eal06tosh6JpAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGGp1c3Rpbi5jaGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIWGeYuaTsnIada5Xx8TR3cheUbgw
DQYJKoZIhvcNAQELBQADggEBAHNQlMqQOFYPYFO71A+8t+qWMmtOdd2iGswSOvpSZ/pmGlfw8ZvY
dRTkl27m37la84AxRkiVMes14JyOZJoMh/g7fbgPlU14eBc6WQWkIA6AmNkduFWTr1pRezkjpeo6
xVmdBLM4VY1TFDYj7S8H2adPuypd62uHMY/MZi+BIUys4uAFA+N3NuUBNjcVZXYPplYxxKEuIFq6
sDL+OV16G+F9CkNMN3txsym8Nnx5WAYZb6+rBUIhMGz70V05xsHQfzvo2s7f0J1tJ5BoRlPPhL0h
VOnWA3h71u9TfSsv+PXVm3P21TfOS2uc1hbzEqyENCP4i5XQ0rv0TmPW42GZ0o4xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwj8BKLXNpALfemdRAwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIIMZGuw48DO0bVMIJyzMduH6Z7v0JyBdCeCX
nZKde9nYMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMTEwMzE4
MjMyMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQAXF4uddVqmmI41lbguO6mi2+A5AwFu0qBZLiLN1wlSjim7NmgyxD5D
9I0Z/HHl8ydzmLRMeKJrwT+HsHlUBv7JxJRaLTSRg5MstyeFbd+VVEug1OJwmXeLAQ1rQ9kSNjzw
P6WIr3ZBYNMP0TUhxpFd/y3PocA8EepZwGG+kp7s+AoHfSwM1TwI3nJuWDh40C7GqqlTPWmGkBvu
vqJWyK51gT6oAPJ30UIvOKN6x/AOgm6U0wxoyQHfXbE+elljBaOrjUAV2vnQLqJVDdv6dRhsH3UT
BJYbPjW+2BMknryPIAj8DE8YFLp2jOWK/TV1hSTKaNSSTbacUhJ3u3gbiibw
--000000000000544d4906094399d3--

--===============7669740188000801705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7669740188000801705==--
