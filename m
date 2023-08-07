Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DF7C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 15:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB70560E2E;
	Mon,  7 Aug 2023 15:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB70560E2E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JljrwEsM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YXj13tQmKiE; Mon,  7 Aug 2023 15:17:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C390460AA7;
	Mon,  7 Aug 2023 15:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C390460AA7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FFB6C0072;
	Mon,  7 Aug 2023 15:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99883C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80AF640A99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80AF640A99
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JljrwEsM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuiQ2eq85py8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:17:23 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7FC64051D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7FC64051D
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so29505735ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691421443; x=1692026243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8+9F0mm26547YwGdsOYT/6OgcExXxmjtiA50SQtPXRg=;
 b=JljrwEsM1fFtKPnszTzIISBcoRaaj7fBrx95Wccvs2g6MsC921pQR/6GbKbfooj9cC
 MNRSGq7fAbsYu+5r4It5zyJFFwXQYy2GI2q9HuaS9fTGzot+l2YzegkF4eeI9RXOiQu3
 ixmB3kf29LycmnoopQPqhEBFhm1BrrkwWtLsIZxbkQEHBu3PmQpu/ZCZZUVAyWZVJPpX
 RiraItHyTa5KIWZNwqTJqDDPp7Et0O4PmzRCmFYQ/5pWsNSLtoVqClVi0ne6ZJFaBzKL
 5xO3C5kI0lNCRa9XifcBTOeLBYxZ5Wpms8J/9B9vNcqNdZEH3ga77/FmZP5eybZXdSCM
 jPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691421443; x=1692026243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+9F0mm26547YwGdsOYT/6OgcExXxmjtiA50SQtPXRg=;
 b=YAIr+leXpi3PwGoeZriDtCZW+j0pk/EBnA3jZb8xOo+uWijSrSMn80SvXt8Ru+uj7T
 0jdMJDFcS6YHFCSgbUoEDJa8KRYntLqifk/YDVsMEczzAam60AfN+J+4iyIyt4h6ZoaL
 r/vCJRs/Er8c1NgU/ZkAjWK4GomCn1y+95yMs5eVzccKvNPW4xKkDq9opkxvDe6A739Y
 qkYGHxJ8pnKC5oWPOOhEvFPA7EUUOmZBRlZGd9Ud4TUdTtBIH4/h2Pb7RUqacYEjGnSY
 z75rSu7jgPmSUGET1OpalNavsSQroxeIF3XZjK6arhg1v91WNbk4NUGlnL1u9O7NU2YZ
 fluw==
X-Gm-Message-State: AOJu0YwnuHr4E7pmbTYuxkaLqjCfMNOei4j38+tmQGqSeyr/1q4uXHUD
 SHMuSIz5OsHSrWnX+otLpVc=
X-Google-Smtp-Source: AGHT+IEdWab8M45OJVYq6HKxCC/BIo1O8CXS+FMGJY+gu/L2pr/OZXQIAidO7BK76Zxz5T74hNQUEQ==
X-Received: by 2002:a17:903:191:b0:1bb:a056:2c5f with SMTP id
 z17-20020a170903019100b001bba0562c5fmr9832821plg.7.1691421442901; 
 Mon, 07 Aug 2023 08:17:22 -0700 (PDT)
Received: from rajgad ([2601:204:df00:9cd0:b50f:ee2a:c29c:a732])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902bd8500b001b89b1b99fasm7018101pls.243.2023.08.07.08.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 08:17:22 -0700 (PDT)
Date: Mon, 7 Aug 2023 08:17:21 -0700
From: Atul Raut <rauji.raut@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2] ath6kl: replace one-element array with flexible-array
 member
Message-ID: <20230807151721.qasrym5x5lqoqjgd@rajgad>
References: <20230804045554.6934-1-rauji.raut@gmail.com>
 <2023080433-patio-staining-2cfe@gregkh> <87sf8zs2oi.fsf@kernel.org>
 <2023080410-unadorned-vertigo-c0b8@gregkh>
 <47f1a06b-8bfe-911a-3a05-da7d522b588f@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <47f1a06b-8bfe-911a-3a05-da7d522b588f@quicinc.com>
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============0094681425773181371=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0094681425773181371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rcfpwov7x5kwjhxg"
Content-Disposition: inline


--rcfpwov7x5kwjhxg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Description: I appreciate the comments. Will refrain from altering this or any other submitted patches, as advised.
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 07:13:20AM -0700, Jeff Johnson wrote:
>On 8/4/2023 2:30 AM, Greg KH wrote:
>>On Fri, Aug 04, 2023 at 10:10:37AM +0300, Kalle Valo wrote:
>>>Greg KH <gregkh@linuxfoundation.org> writes:
>>>
>>>>On Thu, Aug 03, 2023 at 09:55:54PM -0700, Atul Raut wrote:
>>>>
>>>>>One-element arrays are no longer relevant, and their
>>>>>place has been taken by flexible array members thus,
>>>>>use a flexible-array member to replace the one-element
>>>>>array in struct ath6kl_usb_ctrl_diag_cmd_write
>>>>>
>>>>>This fixes warnings such as:
>>>>>./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible=
-array member instead (https://www.kernel.org/doc/html/latest/process/depre=
cated.html#zero-length-and-one-element-arrays)
>>>>>
>>>>>Signed-off-by: Atul Raut <rauji.raut@gmail.com>
>>>>>---
>>>>>  drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>>diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wirel=
ess/ath/ath6kl/usb.c
>>>>>index 5220809841a6..c8ecc9e85897 100644
>>>>>--- a/drivers/net/wireless/ath/ath6kl/usb.c
>>>>>+++ b/drivers/net/wireless/ath/ath6kl/usb.c
>>>>>@@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
>>>>>  	__le32 cmd;
>>>>>  	__le32 address;
>>>>>  	__le32 value;
>>>>>-	__le32 _pad[1];
>>>>>+	__le32 _pad[];
>>>>
>>>>Are you sure this is actually a variable length array?
>>>
>>>It's not, it's just padding. We both told this in v1:
>>>
>>>https://patchwork.kernel.org/project/linux-wireless/patch/20230731012941=
=2E21875-1-rauji.raut@gmail.com/
>>
>>Hey, I'm consistent, nice!  :)
>>
>>But Atul, that's not good to ignore our review comments.  Usually that
>>ends up meaning that everyone will then just ignore your submissions,
>>generally a not-good resolution.
>>
>>thanks,
>>
>>greg k-h
>
>Since the 'pad' field is never directly accessed, suggest the author=20
>respin this this to use simply:
>	__le32 _pad;
>
>That will prevent others from trying to "fix" this actual one-element=20
>array in the future.

--rcfpwov7x5kwjhxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEk+Uz5/8aTg0U2TbgUdAfNFxksqcFAmTRCv0ACgkQUdAfNFxk
sqfOrQwAptc9XDlqik1wPWhDQR3FcwX0d30+AQUk9qPg47CfXTjoY0Wk2eN/f8H2
MSVv4UYFw4vePh83nPkdZMtmaMgck3TWCJ522khoWVM1Auj6y4piuOu7SyYnraPT
CHBxkeBHHOpicHCgCjtojdiaNRFxtCsAmr5dzpI+uKhLZqmUtXcU+CP73xmxcO+i
mMaWrHDvBAha9d1IIFCTcuO0wH+kvz+LJ5UcO9WGgbTjkpLYOwRpekDvHfvgeLPT
4bu/kUExrYnZ20ur34sujn+eBs2ISqAVvpniNrufGDCrUjpjIVHauxEQZgRbGrdF
vQnN992f/hw4+5LQHoVK1IC55GVL6WPw3Q9RIboEgJu5YxASKlSF4Tho1GLDs+Sm
lo+pyxL54zSALszhIjUdXiVSRiW8Oos062rrSfIqTwc0CD3SSdlbUeP4mAMgHkSp
P2P5Tgmevc723Kx05qCaSUa3DAYU4tXvf/YJRSmK4FkGejgdtIEYlDHxXFodPece
1TAGz34i
=Y0V4
-----END PGP SIGNATURE-----

--rcfpwov7x5kwjhxg--

--===============0094681425773181371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0094681425773181371==--
