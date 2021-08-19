Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED042C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 18:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11A86109F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 18:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A11A86109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63694407BE;
	Thu, 19 Aug 2021 18:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7XogsSHsgtS; Thu, 19 Aug 2021 18:09:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 752C1407B3;
	Thu, 19 Aug 2021 18:09:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D39D0C001A;
	Thu, 19 Aug 2021 18:09:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29438C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B4FB80E34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RzDqrwNGlIL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 863A380E2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 18:09:51 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso7690713pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:reply-to:mime-version
 :content-disposition;
 bh=6XBasECxammFzQHik9JIFkQNCu/o2uRkEblD71qF0zE=;
 b=c8lUFj7+YedIOCbaBXW7dsZwZwQpHYcx25ygbcApz2TIbA/Sd79RX8JyqYW+4Ncwxm
 BDpSNzDEuHn7xmDonQ9JXRDmrPxWFXc83JSvWWBCxGp8kziulujjg8/gvparqG3KrFxR
 vALFVQj/cS2bDfi83c2WqF1slX8NEdYM39yGDJhwmwfidDsVL3yKgMkD4hmMB8ZFM8tO
 u0VqZrRyd4EJMhlhbRxkGK7UMK7XpbotUWkK+/bZXlg4EAnDls4YXJjsczjVRxGP9+Uw
 IKtYW21BtpYasA8XO+z1EG9DqJR00t31iy5btuSgblERkSSzjOOkYF0ucBfGTeUPGppM
 ORPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :mime-version:content-disposition;
 bh=6XBasECxammFzQHik9JIFkQNCu/o2uRkEblD71qF0zE=;
 b=nvyuh03YwpHTmJJfgGvABWDiOtt0kYH1xyfUiR5p9q23FP/YJWwqfGzH1gC/BPWNNK
 1IppRp3hUIU9XTDwgfXXHL7MWgRdin/cQ/rhmenHztfzo07qzEZBEMCHp+IqEitAjS4R
 Auy1JisN6DwIfDt3coXeFKg52Qax9Adb11j3KpzwxmmW4n0MzvdyK/M8GyyMPqlDHNtW
 8XPb3AK3QFppS1OfLRb7xnHUtT0Xqi4temZUkCi8Jv3Z/auq/RcVilUUYbnj16tBYFP5
 Z2WZgboc8bihdgp0hlk84CaeG+iAKZ2HdAdeOolJjDelkemx3cov5TOrqMDHDoLAA27w
 7uXA==
X-Gm-Message-State: AOAM5323aoWgEloZJLrxjRVWbAqH71YG5u/2tBVq1qKtBkBLrbyn2Zru
 zu6AVeoBVLsUAZspWeND1nE=
X-Google-Smtp-Source: ABdhPJy9cfyQpqEB/Evmdbm03RVp3Ebcw7/uz8MjGYPJLJNLHLax2OHDeiNYVp6Ui63XDul6hYEuHg==
X-Received: by 2002:a17:90a:2d89:: with SMTP id p9mr21314pjd.138.1629396591104; 
 Thu, 19 Aug 2021 11:09:51 -0700 (PDT)
Received: from rachitt-ASUS-TUF-Gaming-A15-FA506IH-FA506IH
 ([2405:201:1011:509b:9e89:5304:7fb8:daa7])
 by smtp.gmail.com with ESMTPSA id c2sm4271085pfp.138.2021.08.19.11.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 11:09:50 -0700 (PDT)
Date: Thu, 19 Aug 2021 23:39:46 +0530
From: Rachitt Shah <rachitt.lfx@gmail.com>
To: lukas.bulwahn@gmail.com, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Checkpatch Documentation mentorship program
Message-ID: <YR6eapF1R1YNbJpM@rachitt-ASUS-TUF-Gaming-A15-FA506IH-FA506IH>
MIME-Version: 1.0
Content-Disposition: inline
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
Reply-To: rachitt.lfx@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
