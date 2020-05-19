Return-Path: <SRS0=ZD04=7B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCCCC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 May 2020 07:13:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9762D2070A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 May 2020 07:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ftFJE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9762D2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A24A865C4;
	Tue, 19 May 2020 07:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bar0LlaVO6Vn; Tue, 19 May 2020 07:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E635B87899;
	Tue, 19 May 2020 07:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C87C4C0881;
	Tue, 19 May 2020 07:13:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B68C7C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 07:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABCD386A4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 07:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSDAz2itQO43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 07:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 142A386457
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 07:13:12 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id o19so10307975qtr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2020 00:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=gfrfWaOZkm+lseM0+Bvjs6y+xukYp67el0Y4CWHnZUQ=;
 b=b0ftFJE+1Kbvt2EcJL8XpS9a5ExwNsTDEiEOnTqOPYr8y+xJ3Mr+oImwRmzGjlp//v
 CmCFK7j7Tfd1kpwmqw3LhxBKdCnJagToDgHsicBVGo/oByXv4X8VLQWwkzmLsZg78sas
 M0eRaXxMMjmTBHAOd/XhUgwkWJifR+raQ96ZeibY+55upKIQeWUvDFyh5hYoPpG8cLyP
 dmQBBbbtUPgypL0LMYtpD31p1e6spiyXfrPoPxvdIY1m2a/jChmnqVIUtwIwfYTVDEAm
 PSBA+e3U+kjPOtaHuEdJCTXB+P90YJXTFEicGLb/6FNht38avRz0dyQ6+z8N3Vupnc8N
 mV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=gfrfWaOZkm+lseM0+Bvjs6y+xukYp67el0Y4CWHnZUQ=;
 b=rQywzKaK8gUQzu0wPhINK88rZBPb249ha29ZdfYC8T8D2r0W9A7H8sL9DuJC8jlerK
 FWFgYP+OSMI306JibUQlvUAsK8HzxnXabMjevtTyxwBnkfxTfNr4VrfVzZlnP0YOnTo9
 vq1ZuSle0Sj50bi0sTcQj8kyAAEN0jCCAPW3CeCkXxZV6i5BKMyhhPaIq2KVVj+K4cJA
 K35+mLTgnjt4Vq4PSSlSnSfleLh5np4cgKZFNFlwxVr6f86YjIQslyujSkPdWeB4/m5R
 eyhpteODCnfVCC1nnaR38wu2HufmLI8alvtzfH+01XIsEOVAew78xyohd2l9PZTuFBVG
 DkDA==
X-Gm-Message-State: AOAM533Bzd6JmiTiqNvKBusENZmvfIR8UNn+7D8FSGFLzDp56wb5x23I
 0LRlzMIxBUbKDLHS653F6/Y=
X-Google-Smtp-Source: ABdhPJzbE6fW6tR2E4L6m4GsHIiwHGdav4WMcMxfECGS94oEMTElNSWQ/VDyXWvAcctxnZt8hmd8UQ==
X-Received: by 2002:ac8:4e53:: with SMTP id e19mr20328428qtw.277.1589872390952; 
 Tue, 19 May 2020 00:13:10 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id k93sm8840111qte.74.2020.05.19.00.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 00:13:10 -0700 (PDT)
Date: Tue, 19 May 2020 04:13:07 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <C564849C-4E08-4994-A694-A736626548E2@getmailspring.com>
In-Reply-To: <20200517022115.5ce8136c@coco.lan>
References: <20200517022115.5ce8136c@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org=22=22?="
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do
	anything
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

With your current patch the probing code is actually called now, Mauro. Thanks!

As for the sparse errors you've pointed out earlier, I'm at a loss. Yes,
I have noticed them, but let's look at an example (they're all mostly
the same)

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c
>drivers/media/test-drivers/vidtv/vidtv_psi.c:174:43: warning: Using plain
>integer as NULL pointer

This actually refers to this line:

>struct psi_write_args psi_args = {0}

Which seems to me like a valid way to zero-initialize a struct in C? 

Next up is...

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c
>drivers/media/test-drivers/vidtv/vidtv_pes.c:80:54: warning: missing
>braces around initializer

I assume this refers to the following line, which is the same deal as above.

>struct vidtv_pes_optional_pts pts         = {0};


And then there's this, which is an actual mistake. I have mostly
eliminated these, but this guy has slipped by.

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c
>drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36: warning:
>incorrect type in assignment (different base types)


Just one more thing. This change on vidtv_bridge.c:

>vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
>
>dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
>
>-	return status == (FE_HAS_SIGNAL |
>-	FE_HAS_CARRIER |
>-	FE_HAS_VITERBI |
>-	FE_HAS_SYNC |
>-	FE_HAS_LOCK);
>+	status = FE_HAS_SIGNAL |
>+	FE_HAS_CARRIER |
>+	FE_HAS_VITERBI |
>+	FE_HAS_SYNC |
>+	FE_HAS_LOCK;
>+
>+	return status;
>}

I did not understand that. Why was the boolean expression replaced by an
assignment? This was so eventually we could drop packets or simulate
some sort of noise in the event that one of these flags was not set, as
we've discussed at some point.

Thanks,

- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
