Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C474CC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C50E60233
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C50E60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED2440263;
	Mon, 26 Apr 2021 07:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJseG78kFAKV; Mon, 26 Apr 2021 07:21:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4AD2401E3;
	Mon, 26 Apr 2021 07:21:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0F5FC000E;
	Mon, 26 Apr 2021 07:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD9F8C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9ECB403F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWYHzALUg3JH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:21:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C574403EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:21:10 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id o16so62843880ljp.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8QxYaqimGrLqru0CZIZZjeAU44SoYy7oD0r1HmbReqA=;
 b=fwEMCWXBVNZmIOuvteXq/Qrc1TVEnMGFSecEsM07khhmr3feFRA2jDFFtKrIXaMKER
 neY1hQ+2MU2If/W/2QBgQi5TCeZ+FAc5OLU0hmWwdHvp3tviYcIM66jzKP44vHDAMuDW
 GzTDxJ4l2MjhNC4YuJnUZqzUvbPlD21VRgoVqrYZCvplZFe2HZc+WFM+gkOpve84YrJV
 3A8Bhx81NcbA0AmU14/WFqpR4TOeyc0hdpfKaYuVwyM7rdwTB/gqRka48I26Klv6EfIN
 NxNBUDO0aCGgauON0nleBXIlQ37MniCKvLn6UAt2Bj7vz7PJbAKqhqT693fxbtzb2RXz
 /b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QxYaqimGrLqru0CZIZZjeAU44SoYy7oD0r1HmbReqA=;
 b=WJB7Q6J6x5+N2GpGNAJTOYHTyBJ+/bS0A3GSC2GkKiE8u0HcxsQiilyM3z0jdoky25
 V3gdPd1KpQoLUS93Ww6QXFr1qZGEhufPlwPNTbthPLmy3xbruNPsDo3Igk41zkC5ii3h
 KQPABrNnq3Qz4vEO2p/tALYW8tz+q+WurVza/WUnLcdKgARV/aOX1qnxgaSy1GUpZZ2s
 xnA+aAIQAASsHsujS07bLnPF9YzLMCfA0M3bI+Rf499G9bikGjH3SKAsRNW16RDDEqPd
 3GRrXzGvk5+jBswuQ7ypntQhIddLgK3T/PHKIbHShPsbn7adQGzijgjFFA2gFei8r3lH
 z8nw==
X-Gm-Message-State: AOAM532ApQvbTFNRTmqFJZJXv5k8hZlfHc5fHNP1+kG/nMFldZ3FnlIg
 nu2FAdJc5MLH/X2lDCpZhKA=
X-Google-Smtp-Source: ABdhPJwt2Yupug+WTLKhtf6Yhl5QveA2o42KRP9yOwXX5Yj7EhPF529uLbP5VcQuUlEyGTYcaaenWg==
X-Received: by 2002:a05:651c:105c:: with SMTP id
 x28mr12543532ljm.474.1619421668320; 
 Mon, 26 Apr 2021 00:21:08 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
 by smtp.gmail.com with ESMTPSA id u26sm1321845lfl.78.2021.04.26.00.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:21:07 -0700 (PDT)
Date: Mon, 26 Apr 2021 10:21:04 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: LFX Mentorship summer intership
Message-ID: <20210426102104.01c11e0a@gmail.com>
In-Reply-To: <CAKXUXMxJRthAWVsDR+m7OsJ_2O0UMv7SOLoAPE=spgSGZ741Eg@mail.gmail.com>
References: <MN2PR02MB631763A2B44549BBC9A8939DA5479@MN2PR02MB6317.namprd02.prod.outlook.com>
 <CAKXUXMxJRthAWVsDR+m7OsJ_2O0UMv7SOLoAPE=spgSGZ741Eg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: "Wang, Haizhou" <hjw5074@psu.edu>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, 26 Apr 2021 09:12:03 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

Hi!

> Haizhou,
> 
> please register on the LFX mentorship site
> (https://mentorship.lfx.linuxfoundation.org/project/8f69e012-08d0-4e2b-baa7-9143b5f98823)
> for this project and provide all required information there.
> 
> Then subscribe to the linux-kernel-mentees mailing list (see CC), our
> main channel for communication, and send an email with the following
> subject and message in plain-text (not HTML):

Dumb question: is this email required for all mentorships? I send an
application to other linux kernel mentorship(bug fix), but I didn't find
any inforamtion about sending an email.

> 
> subject: [Mining for Maintainers] Interest in Mentorship: <your name>
> message:
> 
> Lukas, I am interested in the mentorship Mining for Maintainers.
> Please provide me with the required technical tasks for the mentee
> selection.
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees




With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
