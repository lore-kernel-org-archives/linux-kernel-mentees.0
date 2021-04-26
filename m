Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F04C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17AE611CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17AE611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4932D605E3;
	Mon, 26 Apr 2021 07:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUpwG2QVx2e0; Mon, 26 Apr 2021 07:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B915A6009C;
	Mon, 26 Apr 2021 07:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94D00C000E;
	Mon, 26 Apr 2021 07:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F1CFC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C9340263
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5LHdidnfzcV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:35:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08673401E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:35:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r128so59810943lff.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fEJ94bgy0Z/T27gCGwk57Hsb0WOhAzUGzhm1/6H2j0=;
 b=E1+UTqdLlBp/OWRYI6tIjEeTJL3kw60oURo76rotxzudIjcfRoq5GTCcllfLdTRmg5
 3VRghcly1MUSjIxjY/eV9U7V38ui3BG7sDUZvfb9nhMAArfeOhCQX9ObhzSGUm2oj1o3
 NkoaXaLthgdjXZiOQl1RIDUDZjFlsyryMy3ISwZCLeechA2X44PoLTG6GOYxSLnU9Uxg
 Cogrkrcb0HXy9QUukXZqFI9kXcmvXkwiCtS9m8+lh3LPZxV6ReE+IR3UvRC6NwZ5QidI
 LekEqN5srMLufeopmMjDzhCLTS3NpfyvxBwKmAHt7fBqUlSGiyQOaheb9LmyiZpLbrj0
 3+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fEJ94bgy0Z/T27gCGwk57Hsb0WOhAzUGzhm1/6H2j0=;
 b=Y1u4H8+X+GCYC0V698KC+pM35CdCTqfcoANFbWyGDVk51dwojIWfRRBi2snkTkXIvl
 2AeBw6jWtM94hRMcJsOIYDWfH5ClZFeuCqcVrUehuMZL3/eZFu2Ny6YpLNlG5s5w7cxs
 CaRmgrF4YpnKj0XZcjLjXGMIxBSvmQkHkBAL6Ge880jJFKYepawLacCXKlFhn1pbqbSt
 UU93o79GEVfcg9SWor3UI+N/LkP7cY4T3Z5Aq2H+/dhUITk67iQEF2WRlGGailwLMURx
 hn/vHwxRu7Tw1jX5ccC8W2T2Ob55VKxsO9XD1W6lADRNBG74QYfYrkWeK+nL7eIkkC6H
 EbOQ==
X-Gm-Message-State: AOAM533R55qfxF9tiokNdaTxzAHh9TfrUFOHRXFm9DT2rJIQbQt+B/7X
 LXPwwwsq/K38PK6RzmrqTuk=
X-Google-Smtp-Source: ABdhPJwpj+5AKF2i6Lnn/rYRRyzic2JhEbDNZZf0Z/LJPtCBbkSOYufd3258qjuYscXVPypIYa06fA==
X-Received: by 2002:a19:f111:: with SMTP id p17mr5537823lfh.582.1619422547965; 
 Mon, 26 Apr 2021 00:35:47 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
 by smtp.gmail.com with ESMTPSA id j8sm1432386ljg.111.2021.04.26.00.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:35:47 -0700 (PDT)
Date: Mon, 26 Apr 2021 10:35:45 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: LFX Mentorship summer intership
Message-ID: <20210426103545.3c90cb87@gmail.com>
In-Reply-To: <CAKXUXMxRUdavZnw03ZTZOf9L3T4Cwwms2-VJTas0GMfkmX8bpg@mail.gmail.com>
References: <MN2PR02MB631763A2B44549BBC9A8939DA5479@MN2PR02MB6317.namprd02.prod.outlook.com>
 <CAKXUXMxJRthAWVsDR+m7OsJ_2O0UMv7SOLoAPE=spgSGZ741Eg@mail.gmail.com>
 <20210426102104.01c11e0a@gmail.com>
 <CAKXUXMxRUdavZnw03ZTZOf9L3T4Cwwms2-VJTas0GMfkmX8bpg@mail.gmail.com>
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

On Mon, 26 Apr 2021 09:30:25 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> On Mon, Apr 26, 2021 at 9:21 AM Pavel Skripkin <paskripkin@gmail.com>
> wrote:
> >
> > On Mon, 26 Apr 2021 09:12:03 +0200
> > Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Hi!
> >
> > > Haizhou,
> > >
> > > please register on the LFX mentorship site
> > > (https://mentorship.lfx.linuxfoundation.org/project/8f69e012-08d0-4e2b-baa7-9143b5f98823)
> > > for this project and provide all required information there.
> > >
> > > Then subscribe to the linux-kernel-mentees mailing list (see CC),
> > > our main channel for communication, and send an email with the
> > > following subject and message in plain-text (not HTML):
> >
> > Dumb question: is this email required for all mentorships? I send an
> > application to other linux kernel mentorship(bug fix), but I didn't
> > find any inforamtion about sending an email.
> >
> 
> This is certainly required for the mentorship Linux Kernel: Mining for
> Maintainers; I do not know if the other mentors also ask to do that
> for their mentorships and mentee selection.
> 

I'm sorry for the misunderstanding. I will ask bug fixing mentors,
thanks! 

> Lukas




With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
