Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CA4C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:58:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7380F2067D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 17:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH2mCPuW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7380F2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB0FE87593;
	Tue,  1 Dec 2020 17:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fopadGTC8hkS; Tue,  1 Dec 2020 17:58:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 717F187600;
	Tue,  1 Dec 2020 17:58:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5125AC0859;
	Tue,  1 Dec 2020 17:58:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC168C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2B2786E26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvMSs3L6iL3u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:58:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2EB286DD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 17:58:46 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r20so1692421pjp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 09:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RgUQLLm2m0+wMcu32vzjhRUlw+osYiYLwwAfKulJLUk=;
 b=fH2mCPuWinazAbr/J8LL3GaAA3WmExxTCDioFBqxvK1DFc08esz4OON8pZvk0+XOuk
 n20Aadc9aNxyRS00UOZ1wWzno/JtmADsv7zdo2tMe8uQoLvGw8wJFtwn+UiBtU3r00Mf
 CCijGvBhxy7GZll/pmIRuWs9rYujGN//RfBohxJRo69aPUb846fDQYSYXGJBd631xI6q
 IcoZ3NkrTZKtqgsgzE9xpUrIMKRi/kDOpPTBbFkl3mIkglKL2k2s97hoHza/f63mISQh
 kzFHWxNyoj83x4LVegcU5kcNmCspcVZmC7CakkO6WMWRsCvS6n+8lVJddcleB/VXzkPd
 zbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RgUQLLm2m0+wMcu32vzjhRUlw+osYiYLwwAfKulJLUk=;
 b=cnm0PuUu3v4QCXy0Ld91HbahxtbP15DiTqdScNpJOY6DBvov1+ui4IQfZ9fRevkjtk
 cNJvqlsxTAiFXtJifLiCQg2bjJTxx6R8bRcf3z17UTSxIuktjntgH5k4DXfkpGXC30LO
 RKRPKDvFMhb87RAOAtUqvwQSju/AKFjZGGBekUdEkcoK1EqTr7569edzMi3KIiMYGtc4
 cO0hAX9zT/1ybtWJu/h4RxEBXaFjFCbgyLNb88uNDToPhPecma3bKWH35uLmZYsjI8qg
 SPDWJqeaglTu6d+cWpqG30fQwuC4Pi6CXZckbp+quLwuL08FXAYG0f0WFf9obFii5Wwv
 ioMQ==
X-Gm-Message-State: AOAM533bnhmMBMhSQ9dBocN8ey0vSIlgXq60isR1DvMWEkP7hgQtcJKc
 GGaki+x/2RHy95XTIIk/3g==
X-Google-Smtp-Source: ABdhPJxuPxYTsYYNqpUl2V2166kDjo0tp482SPp1IRohzSp2dTK/hwUrwwGyv7Orms+u9c5DfBC2ZQ==
X-Received: by 2002:a17:90a:e610:: with SMTP id
 j16mr3909424pjy.170.1606845526583; 
 Tue, 01 Dec 2020 09:58:46 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id o9sm399426pjl.11.2020.12.01.09.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 09:58:45 -0800 (PST)
Date: Tue, 1 Dec 2020 12:58:37 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20201201175837.GA33326@PWN>
References: <20201201155212.132233-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201155212.132233-1-dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Tue, Dec 01, 2020 at 09:22:12PM +0530, Dwaipayan Ray wrote:
> Commit log lines starting with a '#' can be ignored by git if the
> corresponding commit message is reworded by a maintainer using
> git commit --ammend. This minute error can be easily avoided if

s/ammend/amend/

Thank you,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
