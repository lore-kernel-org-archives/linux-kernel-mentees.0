Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E3CC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20610613CA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20610613CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE9C60904;
	Tue, 27 Apr 2021 20:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9SPXwSfxzKA; Tue, 27 Apr 2021 20:20:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A486089A;
	Tue, 27 Apr 2021 20:20:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E30ECC001C;
	Tue, 27 Apr 2021 20:20:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DFA9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C87A404C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNrLTJTWNXf5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:20:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D996C40360
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:20:09 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id o1so3520533qta.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4TgOHtTAg26DJxwlWKeG46zJEUxlWQ5JPxxghRVdkVY=;
 b=l1nJffZ6eWRK06/gQXQaOUtlDhZIsdnLcA226xz2YzVm+6kmx2z56ilsEm9ggKznDS
 F960l2ItoR/SXt48ngBffC+xsxermo/0rfxZZyrdayNp+IHRT1XpvnbVCnEaEsIjZRQ3
 YjkeY0WKavnZqeeOjGchDQEa7QU4J+v7Ez+8L6ZNmtUZxlw4HqNRMe4irUX7nD3tz71S
 oNjbUXHlpgs8lmMyUazQa7EqSthzifuOpAMU5NNDs710hgsSPWqvS3HgA6EAaMhcRDKm
 S8NbGU7QBCRcB4z5LH37OXC1feimV74bOxc6Rnbc/69FDWWjvCyCu+oFUFfzNnprHkAq
 FkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4TgOHtTAg26DJxwlWKeG46zJEUxlWQ5JPxxghRVdkVY=;
 b=rTG4ntR6FmQ8CIvqew6h4GInHZt19Tzag55YQHPVH0Uk7xlbMvbM28F4HkHAKRTyhh
 Ti+bSekv8LMge661VAypEIzE59E0eJZmAf8NcLXN0bqGA3xV0BaiJ26Vbpr7QjLupggR
 kICsiWzw85ss+mPUQnga7MbQVEp0jZa746a0KS5aKaf6a2kS0Q9WtYUSCs0X6cGZHYU+
 8Wo7CrNLoh6dr9VsaitrQTlp9UWhCRkB95wUKJDf6eDH9zLdZKvHQMp8Gma3zq1T5exd
 ufeCI5qmHhrMdW/ZdDOUsnXNhIKWLDgazvnsUjUuG/jX+esFFjAw7eHgqRzyq0EkF1dr
 pqog==
X-Gm-Message-State: AOAM533TbhGSZFIPSlS8Acrq8s8ZPz1bj5zivGEl2iZzFZQIRP+BZcjY
 DR9BvQuv3IVHF5PE09D28LjkCPIs+ooZ9Ul9ZhNnwA==
X-Google-Smtp-Source: ABdhPJyY0lZCim9snX+9c7Jp43HkvQuTGiUS6+JV8KgvL9uxPGeLu4YOAiBYxOQL7Si7DpfdmvEjKCeY/fFVv8OvlXg=
X-Received: by 2002:a05:622a:5d0:: with SMTP id
 d16mr23193553qtb.290.1619554808446; 
 Tue, 27 Apr 2021 13:20:08 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 22:19:57 +0200
Message-ID: <CACT4Y+YC0SRFC=AEzj7cte7zCL_X1U941T25Yia5hpncrJxTcg@mail.gmail.com>
Subject: kernel-debugging discord channel
To: syzkaller <syzkaller@googlegroups.com>, 
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: Vegard Nossum <vegard.nossum@gmail.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

FYI, Vegard created a kernel-debugging discord channel, dedicated in
particular to debugging/fixing of syzbot bugs:
https://discord.com/channels/835915756662947870/836107784252686356
It even has syzbot-feed with notications about new syzbot bugs!
https://twitter.com/vegard_no/status/1386374378364014599
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
