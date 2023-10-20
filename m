Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE237C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Oct 2023 01:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE364211E;
	Fri, 20 Oct 2023 01:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE364211E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiaIiqU1cCwN; Fri, 20 Oct 2023 01:21:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3D87741687;
	Fri, 20 Oct 2023 01:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D87741687
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13999C0039;
	Fri, 20 Oct 2023 01:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD35FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 01:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80BC470395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 01:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BC470395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_1WNvzBShL1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 01:21:35 +0000 (UTC)
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC60C70385
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Oct 2023 01:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC60C70385
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1e9d9455085so396556fac.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 18:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697764894; x=1698369694;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ks5xFPz0neLCFVgjA9rWdPJvEARtx5SNCe643jmQpmM=;
 b=v97JOgQnLgm2YnvPHy76gMMWbPeRv4GYuV6sZeNN4aOobVJr0RWBxGqmB9mELi5FLx
 Psg3UNF1SBdKs+4X3ipuWJ7s7+AXj8+2R/qa3A3p+pqw86gI/HMu31FYmcKxzdYK7aNY
 3kTMtr6u1v/gU2l1j0f4CoH9MVYoVCDvrDdXN9nnx7v3olwQE+oka/EXy/5NfN4mk3kh
 6X0slIooDK9UlI8O9Kk9r1Jhme8+80eI3x837VtXwEcJea+uQPEgmjH5fpo71/A2/uRS
 RS4WiCEXe1VfyzVWhlepISvFNuRrdZsXW9fGysgQ7eb+gCwgmVZ2RSeiguJliqmcCSNC
 aeuA==
X-Gm-Message-State: AOJu0YyhDwx2LAYZSqkdb/9MGxmv9n1FADXyd0kMZgXi+QGlBhVJKNjf
 hDGrfot3kkBH3MmZV94q3UrIF5kaP78mMP8PUk6bYZFcscD1
X-Google-Smtp-Source: AGHT+IHrpg6TOpxK0winCe43JcIjSqnD2Q6uxA1D9TsKfUrc5sYWG4eYpImadqLZDozuSnEkCVr8rbmstAsQm80ippX351MpbQw+
MIME-Version: 1.0
X-Received: by 2002:a05:6871:331e:b0:1e9:c2a7:6593 with SMTP id
 nf30-20020a056871331e00b001e9c2a76593mr256478oac.6.1697764894315; Thu, 19 Oct
 2023 18:21:34 -0700 (PDT)
Date: Thu, 19 Oct 2023 18:21:34 -0700
In-Reply-To: <000000000000f014150604d5040a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000701c7d06081bb14d@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in serio_handle_event
From: syzbot <syzbot+bbc59256015533127d80@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, gregkh@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 rafael@kernel.org, ricardo@marliere.net, skhan@linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com
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

syzbot suspects this issue was fixed by commit:

commit fd6f7ad2fd4d53fa14f4fd190f9b05d043973892
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Aug 28 14:58:24 2023 +0000

    driver core: return an error when dev_set_name() hasn't happened

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17a45b9d680000
start commit:   65d6e954e378 Merge tag 'gfs2-v6.5-rc5-fixes' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff0db7a15ba54ead
dashboard link: https://syzkaller.appspot.com/bug?extid=bbc59256015533127d80
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d70614680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130eedb8680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: driver core: return an error when dev_set_name() hasn't happened

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
