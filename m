Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45628C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 13:58:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C9C20720
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 13:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ub7QlAVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C9C20720
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE1D8884A8;
	Fri, 21 Aug 2020 13:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YiHcSRb+Epp; Fri, 21 Aug 2020 13:58:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA47C884B4;
	Fri, 21 Aug 2020 13:58:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3A81C0889;
	Fri, 21 Aug 2020 13:58:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22AE8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 13:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 001202038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 13:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmXjS5Q8ITgA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 13:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 0D6631FDFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 13:58:43 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id l13so649822qvt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lRZYdcL8E5+Q+swCLW2T3XqoaTIXQs25CRPvYxrxLZU=;
 b=ub7QlAVXFgs1eVgKGJBUWE+lO6dVKED99mkT6VWfmzmysxxiLZLxh+kDhi74m0QuBI
 RbN/YMJsnVzCJvhKjIxLQSgarermdecrNCll48BlhF0NlQrb7NsPx5JfTLupdhTVls0d
 Ab4nWxnohRb8YEbiFeUggV0zac0OovJ0e1sq8KV58cNvo1f70mKrKRslcL96f41coFR/
 7AvWaz3ZPqn0WzYsQtIq/bJBOOHpzlakcTsIShWvkgwL2ui9CaqAVGzW9KIwqFCOO4oM
 d/r4ZJsPjhJ4gDhpF4xhYwA+M2I7Y9poIIIKa2Z/z6zgYUPt7apAckbQoKMwh8XDK7F3
 Xdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lRZYdcL8E5+Q+swCLW2T3XqoaTIXQs25CRPvYxrxLZU=;
 b=OOqi/GHHXcZwZCRbfzv7w3ibeQT4CBBA1FT5v0o8NsJ9dmRh/1DxJlr7OZC9T6KMi3
 HggRF7HVf5bCv3I1rCyCYGaung6R3D4HRzWVVI6F8JOwZMkOqkOytLQiN3dnShD7FuIk
 7V9F/hT8uoOPeewtlbsIJ5ugGbgAqh7YiKvhMUEGttvFGzB/4Y38pTN4pTs65EBUGGKO
 y+iqnH++oCB0NEgK44eb52KbAELScLfwiVV5MLDNFTVKAH6BuRq82D1fCJxg+G5oKk/M
 kI7IuTbSG84P93iyhUoDw27+q/4YQCJNInEhF9Is5iwYQkSFAKeSqck681OaBev7NohO
 0New==
X-Gm-Message-State: AOAM532hnVNNMcJmFvnKvGwPSMidyOJKFKsFHKjSxrB7IaD8XkUQz05c
 jAYuPE6xmanrjD8DiVNKEMPr6qmFUrNq8flhuhlH07xbQG4bcw==
X-Google-Smtp-Source: ABdhPJw8KVKoy4/7Xc92QLmwxcoLjLjk9CdnbHfzN0Sf6THFnxwPtQWnCX5kMJpdrsp1zkyQTu3qOuRnkEIilG1z3g8=
X-Received: by 2002:ad4:5849:: with SMTP id de9mr2418160qvb.22.1598018321569; 
 Fri, 21 Aug 2020 06:58:41 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Aug 2020 15:58:30 +0200
Message-ID: <CACT4Y+bC7Nd7Q_3bva07uQ0e5z_2vnQi85CwY36t3gWqb9eaFQ@mail.gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] What is "linux-kernel-mentees"?
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

Hello,

I see this list is CCed on a bunch of syzbot fixes and emails have
"[linux-kernel-mentees]" prefix. I wonder what is
"linux-kernel-mentees"? Is it some kind of program? Run by whom? Is
there is any page/info/stats about this program? I can't find anything
relevant on the web, nor is there the first announcement email on the
list.

Thanks
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
