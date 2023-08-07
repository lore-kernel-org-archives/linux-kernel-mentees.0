Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F8C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 02:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7131961013;
	Mon,  7 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7131961013
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OILhHfS9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiGpSqtjW8Kb; Mon,  7 Aug 2023 02:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 63A2060FF1;
	Mon,  7 Aug 2023 02:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A2060FF1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA39C0072;
	Mon,  7 Aug 2023 02:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E1E6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 02:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD0504036F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 02:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0504036F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OILhHfS9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WelXUZn__S3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 02:31:13 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 472D5401F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 02:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 472D5401F1
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso2722346b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 19:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691375472; x=1691980272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8MtUmDOT4hbgkhome0dArLibfOqFr9fyGVLclTZcR/I=;
 b=OILhHfS9+nFKQjvYoPSlglBArsK0CU0hgxDWXWIYD0hq+yRtCTi79PUiN349SjmDsH
 ZeNO9vnryPF35q//Xnjwmy3hynss0CgOR5eOfyRsfY+trmKb2rJ/aVkHOd3w6oJmK4pO
 9qaaUaSoiY2cNkW0GHJB194icWWsem6Fnn62zVtxo6xHXmUDMKbqGe1LyGSptnjmdw1T
 YXMYzxGLCDRCAubQexezlwrCVM28uA5BSUCBiTiqwXZnX+q+kLs4CfyNPjLhy5Qtz94K
 Dip8DPK0lVb3JeSIeZUPqKATFS/8RP/yPAPOLv0R9PmSRDBLCqs1rRUfmirFwLqn8KE7
 pvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691375472; x=1691980272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MtUmDOT4hbgkhome0dArLibfOqFr9fyGVLclTZcR/I=;
 b=WVCBZypyzsDWo+XMIAMZBN1gQkb2bre+L5+AZ2z80lHBPJAmrTjmvA3SfFjcoaKBi5
 LcKzQYz+pLowdUHMG/FevdvYOdyUOyFSgLlcmn9TZ71ClQWHHW4tn0g6RuA1tJUxCr4E
 3OTJGQedapSr1WhS+x53BDsiG4SM3eM7uTcpkC9rqej9dd13HHdaEMZ++xW55XyMis4q
 vQt5/N30yfl6i4lscUN+RmSFQ1VA0e13JkJcSF4XI36ivXPSbs3XSrte0w8KJxeY9q6g
 vBHNdR+zSO1mefu9waQPKj3WwR8zBd0CoCtab6uVroeZyHx1+A5r/mYBNPnPhu0lL16/
 Xbbg==
X-Gm-Message-State: AOJu0YxIWBAORAS9wrcp0paRVLrdh+CwLrJ11QEvP8sw2xmgJgaHK0+g
 rQQPNzpCc+Dj0Ti8JK56pnQ=
X-Google-Smtp-Source: AGHT+IHWDWtqlShThH+qeIRbWnFU4LQo1cMNU8kGLBUq5GfaPYHra+rzPBWAuv4AA57BrmNeSeggyA==
X-Received: by 2002:a05:6a20:160b:b0:133:e3e3:dc07 with SMTP id
 l11-20020a056a20160b00b00133e3e3dc07mr8610513pzj.49.1691375472581; 
 Sun, 06 Aug 2023 19:31:12 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:e6a4:a0f3:7393:fde0])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a62e401000000b006877a2e6285sm4944819pfh.128.2023.08.06.19.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 19:31:12 -0700 (PDT)
Date: Mon, 7 Aug 2023 08:01:04 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] drivers: edac: zynqmp_edac: Updates return value check
Message-ID: <20230807023104.GA4030@atom0118>
References: <20230806130514.159102-1-atulpant.linux@gmail.com>
 <2023080631-salon-banter-31b7@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023080631-salon-banter-31b7@gregkh>
Cc: tony.luck@intel.com, rric@kernel.org, linux-edac@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 shubhrajyoti.datta@amd.com, bp@alien8.de, james.morse@arm.com,
 mchehab@kernel.org, michal.simek@amd.com, sai.krishna.potthuri@amd.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Aug 06, 2023 at 03:37:01PM +0200, Greg KH wrote:
> On Sun, Aug 06, 2023 at 06:35:14PM +0530, Atul Kumar Pant wrote:
> > Updating the check of return value from edac_debugfs_create_dir
> > to use IS_ERR.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  drivers/edac/zynqmp_edac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
> > index ac7d1e0b324c..cefbbafb945e 100644
> > --- a/drivers/edac/zynqmp_edac.c
> > +++ b/drivers/edac/zynqmp_edac.c
> > @@ -351,7 +351,7 @@ static void setup_debugfs(struct edac_device_ctl_info *edac_dev)
> >  	struct edac_priv *priv = edac_dev->pvt_info;
> >  
> >  	priv->debugfs_dir = edac_debugfs_create_dir("ocm");
> > -	if (!priv->debugfs_dir)
> > +	if (IS_ERR(priv->debugfs_dir))
> >  		return;
> 
> Again, not correct, sorry.  Please do not make these types of changes.
> 
> Why do you feel this is needed at all?
> 
    edac_debugfs_create_dir uses debugfs_create_dir that return ERR_PTR.
    Hence to check the return value by this function I changed null
    comparison with IS_ERR.

> thanks,
> 
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
