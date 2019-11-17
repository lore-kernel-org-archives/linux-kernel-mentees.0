Return-Path: <SRS0=54Ti=ZJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB15C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E74206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAL3k/nR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28E74206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7C1786399;
	Sun, 17 Nov 2019 17:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFdYB1K2+m-c; Sun, 17 Nov 2019 17:25:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 832848637D;
	Sun, 17 Nov 2019 17:25:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69DB0C0880;
	Sun, 17 Nov 2019 17:25:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D347EC07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BCFBF87AF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bmnjv-HgVgh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5BEE687B81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id w7so8272865plz.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mg4B929k021pDFFZfZsroPj1OaELDXqTHfnRQbTk54=;
 b=rAL3k/nR/SyEPeEbXtfeNLh/FPCVC8U5jI5UxoS5O2wt/SWbQfTDzpq2IwCqqF5bgv
 D9y0NIbIFCqhNRC5wIEy7xHOeE5VeWo1VREBftV3hh6eFq6G+so00raV/zXd7LcP/1Wd
 15pnQJrO8OSrSBAUFfpnV0zJOSC7/cAuWB/LvpQ6EsrMVeCEgQ2GkvLFElXmugM9taP0
 WYhaxU7605IBSmY4wsR/K75YbYFtS7mCPdkjrdJb7Uz8vYGAXo8HWLKgn+rF9esD17TV
 +kTNkVkPaQ/AmB+dbnGXxIKxiyzXPm6frkG6D/Q7XldaC600YxX9lp8asHtFZm2Vm7Cy
 4cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mg4B929k021pDFFZfZsroPj1OaELDXqTHfnRQbTk54=;
 b=U8/LyT3nV6uZOuzzKRbzn/4ywHwO/3Q2tNfY++oofyPwplzu9+d2OCyAuEZkXkPqDM
 zdxF7cpVC1M6BKrwgmlmPO2HaHeq5GUnDGrf0AyuMDaxjq4rZhJ1pBjsJSgiclvJjZFL
 uMSyzTPfu9e2aJsZcyM+ut2vhaO3FIvXt2/J6sHXOh9s5iEEzYPwiaO20V45XKrWVTp3
 lL+8vsALKxdepM3slkZZJjMTtKW0wNJ30CITF/pVqqhsbFnr3MD8tmYdmgkkgbOBdi8i
 4TfEyChdpsdfVPoxt+Gc0UKD4f3rFHD1mHWuNXvHlasGssyHIJgAPIKuvStKzb0ImWnm
 1tIw==
X-Gm-Message-State: APjAAAXHagpoCx3K/I7JiQtOQDOdox8L3W+n61tX9Y5KSZNbHfbI5HkS
 8bif4e5+wWhBQ/lfCkq3gtI=
X-Google-Smtp-Source: APXvYqxzEgApSa2STdoF9ak0XLXHbwK/CwNWTpJRxaegReLY76KfXH1CVtwoe36fbS9tpOpEq4GVAQ==
X-Received: by 2002:a17:90a:634a:: with SMTP id
 v10mr34135336pjs.4.1574011500915; 
 Sun, 17 Nov 2019 09:25:00 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1662:ba74:f9a6:2aa3:8a9a:5581])
 by smtp.googlemail.com with ESMTPSA id x13sm18146302pfc.46.2019.11.17.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:25:00 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: corbet@lwn.net
Date: Sun, 17 Nov 2019 22:54:33 +0530
Message-Id: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: mszeredi@redhat.com, ebiggers@google.com, jaskaransingh7654321@gmail.com,
 linux-doc@vger.kernel.org, neilb@suse.com, linux-kernel@vger.kernel.org,
 tobin@kernel.org, stefanha@redhat.com, mchehab+samsung@kernel.org,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christian@brauner.io, raven@themaw.net
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] docs: filesystems: convert
	autofs.txt to reST
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

The following patch series is for converting autofs.txt to reST, and
updating some of the content.

Changes from v1:
----------------
- Split patch into multiple logical changes as per Jonathan Corbet's
  request.
- Few more formatting changes and fixes, as pointed out by Jonathan.
- Add short description of master map used by autofs.

 autofs.rst |  273 ++++++++++++++++++++++++++++++++-----------------------------
 index.rst  |    1 
 2 files changed, 148 insertions(+), 126 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
