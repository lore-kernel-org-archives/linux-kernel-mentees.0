Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C91C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 06:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9D384E72;
	Thu,  2 Nov 2023 06:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9D384E72
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b6XE/ZHB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFn5o4RzUALG; Thu,  2 Nov 2023 06:00:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 67A6C84CEF;
	Thu,  2 Nov 2023 06:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A6C84CEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41C5DC0072;
	Thu,  2 Nov 2023 06:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6727C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 06:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F110405BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 06:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F110405BF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=b6XE/ZHB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Orn2eKh5bnKo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 06:00:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED3E04002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 06:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED3E04002B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6A59FCE2044;
 Thu,  2 Nov 2023 06:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 902FEC116AE;
 Thu,  2 Nov 2023 06:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698904825;
 bh=TT6oGmKBvrWb94S/vP7d37OfMVFkbdfOksx84tXkYIk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=b6XE/ZHBMLjtASbMMN8/6ByBnKKdvtKquvR6CelIrF5eOPLQ8DMZAOljjerNhqK//
 SutgZS76sJlX+YETNSZXTJTqy8c3q2u3lb17gARz9MFjCsGwwqwmH/Rg+hVnE3k2uf
 BIyhuXDqs/yAfTMz46fKjaTrmdAg1ORe1IJmNNKRfzYjKqUtK3nTLAmQcgUj4K8vyr
 9i9B2Px7LEdG4kVIAu2smrPUR+glDlm5BjBdpgL/5sJj4EWiIhriRTMpFSjTkmnxMc
 gTvY/j+3BPwSaeLlhATqdyOBH8/X+GKt0yjy2UfkBw8fXDy5Pj18C3ruQYFsshW5/x
 poDJL7QpB4Nfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7A7F3C43168; Thu,  2 Nov 2023 06:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 1/2] selftests/bpf: Convert CHECK macros to
 ASSERT_* macros in bpf_iter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169890482549.9002.3230353368904918414.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 06:00:25 +0000
References: <DB3PR10MB6835E9C8DFCA226DD6FEF914E8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB3PR10MB6835E9C8DFCA226DD6FEF914E8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: haoluo@google.com, brauner@kernel.org, linux-kselftest@vger.kernel.org,
 iii@linux.ibm.com, daniel@iogearbox.net, linux-kernel@vger.kernel.org,
 sinquersw@gmail.com, john.fastabend@gmail.com, ast@kernel.org,
 kpsingh@kernel.org, song@kernel.org, sdf@google.com, yonghong.song@linux.dev,
 mykolal@fb.com, bpf@vger.kernel.org, shuah@kernel.org, jolsa@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kuifeng@meta.com
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sat, 28 Oct 2023 10:54:13 +0530 you wrote:
> As it was pointed out by Yonghong Song [1], in the bpf selftests the use
> of the ASSERT_* series of macros is preferred over the CHECK macro.
> This patch replaces all CHECK calls in bpf_iter with the appropriate
> ASSERT_* macros.
> 
> [1] https://lore.kernel.org/lkml/0a142924-633c-44e6-9a92-2dc019656bf2@linux.dev
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/2] selftests/bpf: Convert CHECK macros to ASSERT_* macros in bpf_iter
    https://git.kernel.org/bpf/bpf-next/c/ed47cb27586d
  - [bpf-next,v3,2/2] selftests/bpf: Add malloc failure checks in bpf_iter
    https://git.kernel.org/bpf/bpf-next/c/cb3c6a58be50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
