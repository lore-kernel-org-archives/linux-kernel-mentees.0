Return-Path: <SRS0=KmkD=KU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD2EC2B9F8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 May 2021 04:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5636141F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 May 2021 04:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C5636141F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2796683C25;
	Tue, 25 May 2021 04:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FObYBNItk2D8; Tue, 25 May 2021 04:10:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007A983C10;
	Tue, 25 May 2021 04:10:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDB91C000E;
	Tue, 25 May 2021 04:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E0F9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 May 2021 04:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62D0B404C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 May 2021 04:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2m-KUGvcK3O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 May 2021 04:10:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AC86404AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 May 2021 04:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8638060FDA;
 Tue, 25 May 2021 04:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621915809;
 bh=F1vsYbd/GlvINyjwQQmr6wnTcRu7kV0sEFCqs1mHRmI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jMvxF+OfdXRZC4tIjdTKj1219nBM+LkpYFZ2p8j6X2iI/KHfJBcW4kwHtl1AxUdNu
 CEaJjcv0N7hJVb/MljzzNh9zYx/71/J2yc/vFtMWmQw5RsaRNJPvtH0GfUwZMQpD2N
 8SzSWIIzOQXkLcx5YjvRuOfcVs5L7nQm5PUxWcY6KflrfgLuFFTwKhI6rvD27gXoEx
 OVEkD/Yg6f8+50xKhfZvofRiPKtOfyqb7LSP3PqGiPiHgBowpkZT4Ric0YJr2NP20Q
 QCUWElFEIhNxmXIyMl1/zc1a8uX88GaLPN+GZLNWM2LWMivJr0KC8YEMisvrdkTUBX
 K2G75QeRg/J8A==
MIME-Version: 1.0
Subject: Re: [PATCH v2] samples: bpf: ix kernel-doc syntax in file header
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162191580948.24013.704618312560321536.git-patchwork-notify@kernel.org>
Date: Tue, 25 May 2021 04:10:09 +0000
References: <20210523151408.22280-1-yashsri421@gmail.com>
In-Reply-To: <20210523151408.22280-1-yashsri421@gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: songliubraving@fb.com, daniel@iogearbox.net, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, rdunlap@infradead.org,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org, ast@kernel.org,
 jgg@ziepe.ca, dledford@redhat.com, yhs@fb.com, andrii@kernel.org,
 bpf@vger.kernel.org, kpsingh@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kafai@fb.com
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

This patch was applied to bpf/bpf-next.git (refs/heads/master):

On Sun, 23 May 2021 20:44:08 +0530 you wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for samples/bpf/ibumad_kern.c follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * ibumad BPF sample kernel side
> 
> [...]

Here is the summary with links:
  - [v2] samples: bpf: ix kernel-doc syntax in file header
    https://git.kernel.org/bpf/bpf-next/c/4ce7d68beb9e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
