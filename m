Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F1186E2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089839; cv=none; b=XsElW9PFaRUYEOzzddsBNznVdhYnBmLeicAmumYCyHm2rukf2SQHKWAvdIrPeeCp5EN/N2go1yW75OczUDun4af3W0GqlJe6QSxpNbs4H5ozj8DE0LJJXU3vAsFVhgMxNdIbjf2kPKqS2nL0WZwFmH9uLkJrgat8qI+tPN4rATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089839; c=relaxed/simple;
	bh=w/Fwcmt6wzBhQKj8NSEi6L2yI3ryj/IbNsRhMAgKF98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Scqzw12WAf8ixaJxfsbdOvM8VrnH/3PaCwwyM6rmo0zlBmEPDvCosiI4hEUnN8JbLsd7GDqAy320ZmEW5/4wtNVwcGG+DRd/pKQuBCMDW1Ev3pc54cnOLWplgdWqA5GgyuoKOpBVKILeb/ilPkdTcoE6GPu4u3Q9Zn7x8R92epg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTAWSZCQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTAWSZCQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1AC980CBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o36biAXps7Tb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 17:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1169980C7D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1169980C7D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XTAWSZCQ
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1169980C7D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 17:50:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-202146e93f6so29972505ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089836; x=1724694636; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOf43rLdvXlX2YVrcERQm/M+ITZnbYWg68aFZLl8QSU=;
        b=XTAWSZCQllHrg0KL5f/69STg8msgNqwhmbETO+0lJ4YT/1KhSlmxBNKqmKoyB/XU0B
         9jWuHEQcxzjGM1ShK5Zr+5UM06QDDx9C79fhnurjaDSeC4Ecj1pfLCUyIvNLDvM7kgtJ
         fXdxwtfg/658n6iFqTP1H3fx/KmtOootKUaCkGycAKwpzmdHq/j0AO/wEyPM1J7QcyhJ
         yP8OKD3yY9QVA58D8D3QP5OcVyMqrjnSp6iEKYjeuHpyJmeC4iVmVRzpYyBUwKLNcT21
         A+fRmJ6+GhtavfEDit+Yd46lJ0y6eO6oR9s/trFxZSP6xxOq6RODOviSAlduwCoOGSYJ
         CPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089836; x=1724694636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOf43rLdvXlX2YVrcERQm/M+ITZnbYWg68aFZLl8QSU=;
        b=Vk9SlF3e9l9/zji9KrqcHzfS49hQo5+8v3FiBcSF0vAtDyu1DrnMMBBu/wIr5xKN0x
         vB7wXemZ0D5OiENsEQVGagmW6JooucOUm6fW5HkW2ANoX4f8Zbjt5k7/L64vcr4C+0UX
         uinpH3XsT94aiu0V+fZUrjU8EEJGQjRaeEUs6cus9sxfEP54AP8fmMVdQIBD40brLscP
         md3T1ZGwDuHd2VwGu8y6GNPbKawl5xUCwJUjtLHZGPEtaB4ZKnO8qelffx+9loGVguYW
         WpEXcrJjPHLltrMblmjFrxHmjShK/YN8XTYJ0ghgF8VeWVBl1t2nikWPzY3Lrn4qvUZ3
         7ZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX3TEAaAb6eEf8kDakXd/mQO3Hrs3R21hjYHMsFjkVYTZ1oYdEASfV+XTmqCrq12BIJ2KTyGJsF63qscON1WwqUStitpEDneFZXS0qOt6ZehEgdQVRNBx2ywdj5jOi
X-Gm-Message-State: AOJu0YxQYFMvhzrX5CtTbgOJUTWV9+/LGqdQ2AZTWzK1TkSvsRThhicV
	QHvvHzMUSi7bkzhTKSgoMK/VzFg59NqHuhx1obVu02qGnWK2eqSt
X-Google-Smtp-Source: AGHT+IHthh45koxlcqVb51AsdJSIiP+ADIZPw47JXoa3D6QFq1yXv+bLoH3499/vUQxg94w0/AWJPw==
X-Received: by 2002:a17:902:d2c2:b0:202:5ac:fa49 with SMTP id d9443c01a7336-20205acfb5fmr141255095ad.51.1724089836004;
        Mon, 19 Aug 2024 10:50:36 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.231.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fa4e0sm65064025ad.7.2024.08.19.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:50:34 -0700 (PDT)
Date: Mon, 19 Aug 2024 23:19:20 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
Message-ID: <ZsOFoP+NR/pGNC5M@embed-PC.myguest.virtualbox.org>
References: <20240812171019.561321-1-abhishektamboli9@gmail.com>
 <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>

Hi, Neil
Thanks for the feedback.

On Mon, Aug 19, 2024 at 05:41:07PM +0200, neil.armstrong@linaro.org wrote:
> On 12/08/2024 19:10, Abhishek Tamboli wrote:
> > TODO : Add missing comments for ILI9341 register definition.
> 
> Please rephrase the commit message, and explain why in a proper english sentence.
Sure
> Neil
> 
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > index 775d5d5e828c..cba6a6952568 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > @@ -121,19 +121,19 @@ struct ili9341_config {
> >   	const struct drm_display_mode mode;
> >   	/* ca: TODO: need comments for this register */
> >   	u8 ca[ILI9341_CA_LEN];
> > -	/* power_b: TODO: need comments for this register */
> > +	/* power_b: Power control B (CFh) */
> >   	u8 power_b[ILI9341_POWER_B_LEN];
> > -	/* power_seq: TODO: need comments for this register */
> > +	/* pdtcaower_seq: Power on sequence control (EDh) */
> >   	u8 power_seq[ILI9341_POWER_SEQ_LEN];
> > -	/* dtca: TODO: need comments for this register */
> > +	/* dtca: Driver timing control A (E8h) */
> >   	u8 dtca[ILI9341_DTCA_LEN];
> > -	/* dtcb: TODO: need comments for this register */
> > +	/* dtcb: Driver timing control B (EAh) */
> >   	u8 dtcb[ILI9341_DTCB_LEN];
> > -	/* power_a: TODO: need comments for this register */
> > +	/* power_a: Power control A (CBh) */
> >   	u8 power_a[ILI9341_POWER_A_LEN];
> >   	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
> >   	u8 frc[ILI9341_FRC_LEN];
> > -	/* prc: TODO: need comments for this register */
> > +	/* prc: Pump ratio control (F7h) */
> >   	u8 prc;
> >   	/* dfc_1: B6h DISCTRL (Display Function Control) */
> >   	u8 dfc_1[ILI9341_DFC_1_LEN];
> > @@ -147,7 +147,7 @@ struct ili9341_config {
> >   	u8 vcom_2;
> >   	/* address_mode: Memory Access Control (36h) */
> >   	u8 address_mode;
> > -	/* g3amma_en: TODO: need comments for this register */
> > +	/* g3amma_en: Enable 3G (F2h) */
> >   	u8 g3amma_en;
> >   	/* rgb_interface: RGB Interface Signal Control (B0h) */
> >   	u8 rgb_interface;
> > --
> > 2.34.1
> > 
Regards,
Abhishek
