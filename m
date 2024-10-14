Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025DE168491
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899434; cv=none; b=WGrbaCW3wpxzJye6L1tPDKCCciRdkjMpxbdCCnVgoN/0b6a3JzJBVorFQ8iva6usoYEQEbojTadX7+MRGxcwTCFIMBXoB+i2mLmSNjXe+Deb99rZmw7Bb3xZkN2R9w0UXwDJIo/HNosewNhOJF8KJfOL3MKsiJyqUckpxS9y0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899434; c=relaxed/simple;
	bh=C7Yx4DBLSGhLfhwFlsYhQHfKDsQCzVNXxnWgEMgLKSk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=t2JD+PwuWfLIeRDIO+dWqVU5v041MjysipBEnib35ubTxa7ng9y437Q/XizMWvaQRz+m/qxbDGXFmjyUrugcKwyIZe7BMNxgMs6keISwqyMawAEE+IKM0bJ9jjTJBkFq1ZM/tyGi1ksQAOtSXRKcOKmco8wQolZ4ls8Zs/NwEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r5u7iapi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r5u7iapi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BEF680E07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 09:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaG-cujyNc6k for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 09:50:31 +0000 (UTC)
X-Greylist: delayed 420 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 14 Oct 2024 09:50:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C1CD80DEB
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C1CD80DEB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=r5u7iapi
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64; helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com; receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9C1CD80DEB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 09:50:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736EE8BE;
	Mon, 14 Oct 2024 11:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728898907;
	bh=C7Yx4DBLSGhLfhwFlsYhQHfKDsQCzVNXxnWgEMgLKSk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=r5u7iapihoc8rDemMHEu+tVCB1ATI7uNVuzOzyoPmDQeCO3B9CrcuYNm1HzBX1ZJp
	 I18wbLE5UH1oAvPogDkuVCHVHfbBUQnDJ2ANNJMKhV6kTjq51/ynt9XBI2ALFQ/zWl
	 MVOBK1c5WNwQf/+lREuix3xBD2N+orawcE2k/r3c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241013142511.9946-1-abhishektamboli9@gmail.com>
References: <20241013142511.9946-1-abhishektamboli9@gmail.com>
Subject: Re: [PATCH] usb: gadget: uvc: Remove extra semicolon from the macro
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Frank.Li@nxp.com, m.grzeschik@pengutronix.de, dan.scally@ideasonboard.com, andrzej.p@collabora.com, quic_jjohnson@quicinc.com, shuzhenwang@google.com, arakesh@google.com, skhan@linuxfoundation.org, rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, gregkh@linuxfoundation.org
Date: Mon, 14 Oct 2024 10:43:25 +0100
Message-ID: <172889900570.877857.1005868402461236136@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Abhishek Tamboli (2024-10-13 15:25:11)
> Remove the extra semicolon after the
> do {} while (0) in UVC_COPY_DESCRIPTOR macro.
>=20
> Fix the following checkpatch.pl warning
>=20
> WARNING: do {} while (0) macros should not be semicolon terminated
> +#define UVC_COPY_DESCRIPTOR(mem, dst, desc) \
> +       do { \
> +               memcpy(mem, desc, (desc)->bLength); \
> +               *(dst)++ =3D mem; \
> +               mem +=3D (desc)->bLength; \
> +       } while (0);
>=20
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/f_uvc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> index 40187b7112e7..edf0355d712c 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -465,7 +465,7 @@ uvc_register_video(struct uvc_device *uvc)
>                 memcpy(mem, desc, (desc)->bLength); \
>                 *(dst)++ =3D mem; \
>                 mem +=3D (desc)->bLength; \
> -       } while (0);
> +       } while (0)
>=20
>  #define UVC_COPY_DESCRIPTORS(mem, dst, src) \
>         do { \
> --
> 2.34.1
>
