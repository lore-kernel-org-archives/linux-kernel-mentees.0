Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04A3C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:34:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD8420872
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi1COXsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD8420872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0112F20433;
	Tue, 15 Sep 2020 11:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRAJ0d1P5FaW; Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 328EE1FE32;
	Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 177FFC0859;
	Tue, 15 Sep 2020 11:34:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB54C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EEAD886398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2YtJFsd9z76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92FDF84C9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:34:25 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z4so2942766wrr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KcVjjdtJbtHR0F3E/ZCoGBP7GHsOmNUi9fWgy5zaUto=;
 b=fi1COXsLJGgFezUJl3pJtC3xFILqUs+NV7S1M62e9rsC80DlZXil31x8Y1YRrahQs1
 Ku2VN6WgZq+C/XMlUQDSJ0oz0cQaISl6ESbs1I/3gVGYUG+bW1UDGHJDM6sZQtRz4aJ3
 mLedt0MaHzkYke4ru0hdWtUtb3ajXW2A2s6ScevXIXEh3Zyb9QDwdviloW5dqRCtf2mX
 1XwqdWVZS/6eleUKb+7Yq7khmIbzPo+6tWTWRYFsiCLUN7f4UPV/4vgYGDOTmofazNVy
 /0bSHBfOkOK+ecuswRzvgFaKjsVgX9wbiTb/glM8RYQmTVSyBgEdXtDqhTY2uJS6Haqh
 ILmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KcVjjdtJbtHR0F3E/ZCoGBP7GHsOmNUi9fWgy5zaUto=;
 b=HyvF4nY4WJYC6X+8SN+t+coAXgQYEMoG+tV7EcEt4LYmWRaUskqZ2ss3LgRkwGBMiw
 4DmxGrPD/IilycYFjMU9QAu7x3/VuaJqHxuEexxKngUBKG2QII0y12jcstWNi4NQq1DN
 rzRxl+3Z+XsPfqFGBxsUp6/0sB/Cl2rChZK4uZGxY7uMr4FDUqYGx2Jv0AjAekO3sDqw
 VWOmQC8DizKlTbXk0Qs9kmTpk0PbrKMR3JkcJ2jQGP5UI+1puLq1s4wUPax9qY8mgE4y
 RzIQXsV71J7DCz1wfNZZ5b3akeEoY7PVcJTdwdC0cF+Mm2xuaXwMOkwMBZiuvapKuHxy
 9GxA==
X-Gm-Message-State: AOAM533NODP4cdwMUBXaqDdjwG2I7mad4uZ1OeOPkAvB1NShepY1esTp
 9NhUE9cohUi93Q/0/hWt0LU6EsxpVu5JMI1ZDYg=
X-Google-Smtp-Source: ABdhPJylPQhoBd4SKXTu1ia0FbsWm6+w5xi1FjuWlycKyL/63V2JQFNDhlsj1Yir+9/xAm0dVyp1M7YQDjYQMFjMCYQ=
X-Received: by 2002:a5d:4710:: with SMTP id y16mr21675570wrq.203.1600169664013; 
 Tue, 15 Sep 2020 04:34:24 -0700 (PDT)
MIME-Version: 1.0
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Tue, 15 Sep 2020 17:04:12 +0530
Message-ID: <CAOY-YVkOq8cr4_hs8BOtEOL-1BsQDznsDG6cLYQUBoM7Gag7ig@mail.gmail.com>
To: syzbot+dc3cab055dff074f2d7f@syzkaller.appspotmail.com
Cc: syzkaller@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] #syz invalid
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

The reproducer is no longer triggering the issue on linux-next.git or linux.git.

Thanks,
Himadri
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
