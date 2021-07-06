Return-Path: <SRS0=ODY0=L6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48065C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 17:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A4B61C58
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 17:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A4B61C58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE24683419;
	Tue,  6 Jul 2021 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdJedcOhf_xn; Tue,  6 Jul 2021 17:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E633283133;
	Tue,  6 Jul 2021 17:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDD85C0010;
	Tue,  6 Jul 2021 17:15:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7646C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 17:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8AD24013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 17:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkW2ySJkncSG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 17:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3696E400A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 17:15:35 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p21so17818380lfj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Jul 2021 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWyF+hqgVMW9DD7yaM7VXmC8kVQUfGovOhuk5Dj2s3c=;
 b=Lx4/yVrGvBMc4Mq1hdAiR5H9p8gE/Zszgye5kZRD9HJsj46DIYPNa+zeKoaRFIly4V
 IGbjGzL7fqXQeOVOf5kZ9KShRym/UILbBDIk9QDjxLVcb9aowDDdg4koEW9g0tmKiXeh
 7Y9GDQs6rBwNe2Pa0038UKI3FVQhxWRolQ+hobZkeGrc9thk8oCXyjzNdq6hgafOUskO
 1mk+KKb+PIQyrhyRHai+eWgxg7JTrc8KH5Z6hexE/wYaKiaxAFBHpD3CbzHD11CXwjsP
 uS5wKpxZba2e0HhLmupp8vf4iT6OTz89d+NaadJkzLsIBLV4Ajg5XWuATu4NPt2QYMMp
 vc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWyF+hqgVMW9DD7yaM7VXmC8kVQUfGovOhuk5Dj2s3c=;
 b=DCn+kf5+TmNk49JqEmxk4hfIp1WjX7G0+YyD3QCAb9AoSGfdgcj4CR3Ro93xITeBm3
 PRdz0Y3OgBuW6Yx+b+6PSTiWvvMAI4i/nYUIafUrgjbV4MQaHMuptQbAL7ZP9l5ZcSFk
 n51fKLI37UTLtAcqMRKsFYxPx0HYjZXxu41tDHz0F6KuBOuCXHSB3sBRH+y0euMyzIcP
 EdXVEa06bPOA1w8NswE3h+d3DkCWpOEoWpyiqDC41D47T1QQOIVFTuN7PBrcTYZMw2Nd
 mKu8Xy2jo5oVyVI0r00L2AaFDtY4mnsB8UProhtxttfjkDUwumS/1jVVYprtdo6yOMsB
 +h+A==
X-Gm-Message-State: AOAM5306Es9Ye4SusDuo6HR8LoQACT36jk4CeOTfnWHod703/gE+f7bF
 OBxXPdNfb5HCirt49DabC54=
X-Google-Smtp-Source: ABdhPJwDf6LNLuwEmaLgbx6AO4W6ydGI43rRBUls+V+lciQz6PnaptwrL2lyrmDu0IfcuPVhZVJq5g==
X-Received: by 2002:a19:f012:: with SMTP id p18mr1088775lfc.298.1625591732888; 
 Tue, 06 Jul 2021 10:15:32 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id q187sm1769511ljb.15.2021.07.06.10.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:15:32 -0700 (PDT)
Date: Tue, 6 Jul 2021 20:15:28 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
 gregkh@suse.de
Subject: Re: [PATCH 0/2] media: go7007: code improvment and bug fixes
Message-ID: <20210706201528.4b110719@gmail.com>
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

On Sun, 20 Jun 2021 22:44:33 +0300
Pavel Skripkin <paskripkin@gmail.com> wrote:

> In this patch series, I fixed memory leak reported by my
> local syzkaller instance and increased go7007_alloc() execution
> speed by removing reduntant zeroing members in kzalloc allocated
> structure.
> 
> 
> Pavel Skripkin (2):
>   media: go7007: fix memory leak in go7007_usb_probe
>   media: go7007: remove redundant initialization
> 
>  drivers/media/usb/go7007/go7007-driver.c | 26
> ------------------------ drivers/media/usb/go7007/go7007-usb.c    |
> 2 +- 2 files changed, 1 insertion(+), 27 deletions(-)
> 

Hi, media developers!

Gentle ping :)



With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
