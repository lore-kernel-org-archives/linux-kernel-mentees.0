Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42D1C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 18:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281A56101A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 281A56101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D613E834BA;
	Sun, 18 Jul 2021 18:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqOhCHFN2T76; Sun, 18 Jul 2021 18:20:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 20F6F83498;
	Sun, 18 Jul 2021 18:20:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB632C001A;
	Sun, 18 Jul 2021 18:20:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14BE3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 18:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E755A606F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 18:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3vfN_WwbThV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 18:20:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7632A6059A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 18:20:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id go30so24356395ejc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 11:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Z0PLZOjmlTZhFkQ/g/OF17pa4YwMAP7PPV/iN0FpfD0=;
 b=mX5S8rf3pYHtYy0sPAbUd1wJ8ZO76GGxC4sYBjeJkI1qZShIHNc29Qkaew5SgCpPKi
 uVNHND2aFIrwF7o+KuYw+3TJ85Nz+bEReozXtOFkXFu2KQieugD/dmrghB0oW8yfE5mt
 EZBPFIOHc6rVv/2lfYp3NOQhbr5cPsy+SAsTlhxViMsVy1axZHpVCewK9Dg7Bl8MQtmo
 rTkgDTUO5C2soJ+5P7W5rs1onOWmRezwQpFJInyIPirwsQzaNB6GHNpjHiBhKlt64suo
 AX2XT35kwX2HguZqFr6g/foj2vVJA6qUTlxsP0wERH2atnO0X4vMDSmT7NYDpqtR3oJc
 K7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z0PLZOjmlTZhFkQ/g/OF17pa4YwMAP7PPV/iN0FpfD0=;
 b=a0qUQsS+1KpwKChPyyFr43CKVE5ZazQmzOf++xSTRBdkXaDhqBFjd/VmPE2gBNmBp8
 6Ei4VQA1iFz+VlOR5uR0pOufLBo77pbl5QHrlrlxzLm3LrfNHDUPw8Hp7retY9OHeVBh
 s4PHvgCNjKyuJrjKxgHNWAtqe5GWwtteztg2gPqSMa7zdpQnugY7MSQRtnFG4D+ku/Bm
 Q7i+BqYsDHRyvbbE56fXlqPp8eFM2Tz7HjXX/kUrlpYruIgff5A8WmyGkJYKxyMJkeqh
 8ZtbZKwxWugCQQ0wL5O6gkpC6puox/GThCG5DiPAoeC9ecF4u9cr7KEoX18hyu3+3j25
 Q+tw==
X-Gm-Message-State: AOAM5334xa7FPvhqf+EJUERmXC8uu2TuduJUe10A2RfZ6H9/cDE14CiP
 jhiMrrRpClSJBfwUo/aQlGZM3GgnWXzQxOcuYnU=
X-Google-Smtp-Source: ABdhPJwY8VDgHAc/vaJFKx5/0LrYoV0g/7HKJEvzhfMzrQvQRYqOiobDJyRhXJEND9JIHcoIqF0hQfww3VTZW9YbagY=
X-Received: by 2002:a17:906:4696:: with SMTP id
 a22mr23506993ejr.475.1626632440993; 
 Sun, 18 Jul 2021 11:20:40 -0700 (PDT)
MIME-Version: 1.0
From: Rahul Joshi <mrjoshi0147@gmail.com>
Date: Sun, 18 Jul 2021 23:50:31 +0530
Message-ID: <CALDYK763Nr2qJ_W3KngG+H+kAfwtgcAa=PvXggYLyCdD+y-iHw@mail.gmail.com>
Subject: Linux Kernel: Checkpatch Documentation mentorship
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
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
Content-Type: multipart/mixed; boundary="===============8319677993084932110=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8319677993084932110==
Content-Type: multipart/alternative; boundary="000000000000d35b1905c769e0fe"

--000000000000d35b1905c769e0fe
Content-Type: text/plain; charset="UTF-8"

I am interested in the Checkpatch Documentation mentorship program, and I
would like to work on the tasks for the mentee selection.

Yours Respectfully
Rahul Joshi

--000000000000d35b1905c769e0fe
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>I am interested in the Checkpatch Documentation mentorship program, and I
 would like to work on the tasks for the mentee selection. <br></div><div><br></div><div>Yours Respectfully</div><div>Rahul Joshi<br></div></div>

--000000000000d35b1905c769e0fe--

--===============8319677993084932110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8319677993084932110==--
