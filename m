Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E656E78488
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Oct 2023 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE40F41800;
	Sun,  1 Oct 2023 19:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE40F41800
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bfgNtGHV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azAFuaC55Tny; Sun,  1 Oct 2023 19:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 41059417E7;
	Sun,  1 Oct 2023 19:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41059417E7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B095C0039;
	Sun,  1 Oct 2023 19:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AE7AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 19:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4269381E6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 19:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4269381E6C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg
 header.b=bfgNtGHV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OclGtaBhAsSL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 19:52:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A97181774
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 19:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A97181774
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 57540CE01CE;
 Sun,  1 Oct 2023 19:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B30C433C8;
 Sun,  1 Oct 2023 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1696189970;
 bh=ZGQENGSahEoVx6fJGon6K+BHKe100DMoxRc4b9GoTCI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bfgNtGHVcUNLcRHC/fVp4HQ6w1RZv55FqcSjpnRdSfxh0B4BYrzD7aQms1eoxl+tx
 /mbFvokBAGso9Iof6HlThOsOca8o+OZt/gv56pBJPlFhf6eqhDr9BKy8FgaJjPBKuY
 n5VJNim+Ny1f95N4WSAqhInLl/wZ+kYOWRF91jJs=
Date: Sun, 1 Oct 2023 12:52:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Subject: Re: [PATCH] selftests:proc add missing field KSM in smaps_rollup[]
 array
Message-Id: <20231001125249.7c4fde44bf12ec7bd1ccf12a@linux-foundation.org>
In-Reply-To: <20230930122523.118173-1-swarupkotikalapudi@gmail.com>
References: <20230930122523.118173-1-swarupkotikalapudi@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, shuah@kernel.org
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

On Sat, 30 Sep 2023 17:55:23 +0530 Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> wrote:

> Missing field KSM is added in g_smaps_rollup[] array as it
> fixes assert in function test_proc_pid_smaps_rollup()
> 
> Without this patchset test fails for "proc-empty-vm" as can be seen below:
> $make TARGETS="proc" kselftest
> ...
>   selftests: proc: proc-empty-vm
>   proc-empty-vm: proc-empty-vm.c:299: test_proc_pid_smaps_rollup:
>    Assertion `rv == sizeof(g_smaps_rollup) - 1' failed.
>   /usr/bin/timeout: the monitored command dumped core
>   Aborted
>   not ok 5 selftests: proc: proc-empty-vm # exit=134
> ...
> 
> With this patchset test passes for "proc-empty-vm" as can be seen below:
> $make TARGETS="proc" kselftest
> ....
> timeout set to 45
> selftests: proc: proc-empty-vm
> ok 5 selftests: proc: proc-empty-vm
> ....
> 

Thanks.  We fixed this in

commit 9d1be94df5acd486b157e85ffa53d344e5b17e22
Author: Alexey Dobriyan <adobriyan@gmail.com>
Date:   Thu Sep 7 14:10:12 2023 +0300

    selftests/proc: fixup proc-empty-vm test after KSM changes

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
