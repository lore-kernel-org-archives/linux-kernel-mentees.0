Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F41487FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723151462; cv=none; b=QbBE/uBNC6xQ0vp0jfevypsPV5MmOeZrk1iYq1A9YKh2VBqcoV71nHb2/IV8U/2KygwgD52vnfxF9hl7VHpQxRNBk8PgHcwcHkkbFPyjcVrw076Wge5gx55+5DYuxrEARSRU98uzmrY0cv2cwqTy1LvQKFdqLzSnnIe6UertFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723151462; c=relaxed/simple;
	bh=llIU06gfKtRDoG9fpLNU1I/0OHT2gP9IjHJJSoxWUQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAprm2OB7L7Oro8q2G5PiNGcUplySrO/HwIfSWweJsM2dFfrbd/ikr2/eJGqKf4q1UztrH4NjX8zbajCitdcSFLllfq/IB49tbj/OFWfEvjKUB5v2fwn5HxM6IyEH2vn5xb8coMOTuAvzRS7e0sGuUh9RRWJ0HizVlBwBD4hiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAAEA81EBA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 21:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.2
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy8L3CbvkQ7z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 21:10:59 +0000 (UTC)
X-Greylist: delayed 1164 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 08 Aug 2024 21:10:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 139D0813AA
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 139D0813AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mgr@pengutronix.de; receiver=<UNKNOWN> 
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 139D0813AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 21:10:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1scA6d-0005Hr-33; Thu, 08 Aug 2024 22:51:31 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1scA6c-005VXW-FQ; Thu, 08 Aug 2024 22:51:30 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1scA6c-008xqo-19;
	Thu, 08 Aug 2024 22:51:30 +0200
Date: Thu, 8 Aug 2024 22:51:30 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <ZrUv0tX7r0RuWLW2@pengutronix.de>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
 <20240802181841.GA21917@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xso69ZZn0vzq1Akv"
Content-Disposition: inline
In-Reply-To: <20240802181841.GA21917@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel-mentees@lists.linuxfoundation.org


--xso69ZZn0vzq1Akv
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Aug 02, 2024 at 09:18:41PM +0300, Laurent Pinchart wrote:
>Hi Abhishek,
>
>(CC'ing Michael Grzeschik)
>
>Thank you for the patch.
>
>On Fri, Aug 02, 2024 at 11:32:47PM +0530, Abhishek Tamboli wrote:
>> Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
>> and uvc_v4l2_enum_format().
>>
>> Fix the following smatch errors:
>>
>> drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
>> error: 'fmtdesc' dereferencing possible ERR_PTR()
>> drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
>> error: 'fmtdesc' dereferencing possible ERR_PTR()
>>
>> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
>> ---
>>  drivers/usb/gadget/function/uvc_v4l2.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index a024aecb76dc..9dd602a742c4 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -121,6 +121,9 @@ static struct uvcg_format *find_format_by_pix(struct=
 uvc_device *uvc,
>>  	list_for_each_entry(format, &uvc->header->formats, entry) {
>>  		const struct uvc_format_desc *fmtdesc =3D to_uvc_format(format->fmt);
>>
>> +		if (IS_ERR(fmtdesc))
>> +			continue;
>> +
>>  		if (fmtdesc->fcc =3D=3D pixelformat) {
>>  			uformat =3D format->fmt;
>>  			break;
>> @@ -389,6 +392,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, st=
ruct v4l2_fmtdesc *f)
>>  		return -EINVAL;
>>
>>  	fmtdesc =3D to_uvc_format(uformat);
>> +	if (IS_ERR(fmtdesc))
>> +		return -EINVAL;
>> +
>>  	f->pixelformat =3D fmtdesc->fcc;
>>
>>  	return 0;
>
>Michael, you authored this, I'll let you review the patch and decide if
>this is a false positive.

Since the following patch was applied,

https://lore.kernel.org/all/20240221-uvc-gadget-configfs-guid-v1-1-f0678ca6=
2ebb@pengutronix.de/

the issue is technically impossible to happen.

However the patch I mentioned was only applied recently and in all older
kernels someone could add a format into configfs that is not part of
uvc_format_desc from drivers/media/common/uvc.c and therefor can run
into the issue.

As this will also not hurt the current kernel I would like the patch
to be applied with the Tag:

Fixes: 588b9e8560 (usb: gadget: uvc: add v4l2 enumeration api calls)

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--xso69ZZn0vzq1Akv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAma1L88ACgkQC+njFXoe
LGQvWxAAzqq9SXBuTDZV+u1WYwC2A4U48+AdS9D9DskUf5r1GRxNg2cH65cieEIa
czj7t5zNQjjimIEbiltd8MHVgySPfmQZnbcLPk1XTG1g7Il7gco34zZnGVnj6lA6
+A7+bm34yjYJ4hKkFzaao1r4Nlp1wDEGxH1vmFp9VRvoTp6eszXpluyHWccqOuVA
2UvkBab1a6VUJ9Q2Wdf/7MzShrW2QfWoTAodUm9avrRHcHq8Tc1ia1WW5hyS++82
BFE9AmCKNnc94N6aBodi2xSQbTAD8xgCa33kM5veHao2C3W+mc0nygVPF/D+UzER
ZkQNY6+P3XTV7GoJv408W68marWmNunBxCgaRYgdafJNrUOBm7eI7CElSQzshcZH
7wWlfji7W4cFyUheHimFCEuoAZzAgYJhr5GwaL9F0xNqHU7rI70eR2/iYYcyE29z
SlLb1+VOXKiPBvgp4Musx2UL7qNL/XnhS8+0huPRPGq+WV4SZGeow2oPqxLYqnd1
ArBX8WTR5+Q01FhHU7IG5KlO81UxgOmB5RwQEaOFrEK0TSW2qaM8mhVbU4PTcN5x
IM/txaXUIy4wyA1ZpQTTCcthptKdudAwW/cLr1Xr9pFFO5qcvjRFZP24/fTNJr7G
ElhgJETM1HeeItvGkk7mAi51W+yAIBGqu0KQi5B4qOLlqpJlsHo=
=drdN
-----END PGP SIGNATURE-----

--xso69ZZn0vzq1Akv--
