Return-Path: <SRS0=yBHU=KW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E3CC4707F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 May 2021 04:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC540613BC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 May 2021 04:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC540613BC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA6BC82FCB;
	Thu, 27 May 2021 04:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vqu4A2vMcmld; Thu, 27 May 2021 04:29:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ADE482F31;
	Thu, 27 May 2021 04:29:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F277C000E;
	Thu, 27 May 2021 04:29:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFDEDC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 May 2021 04:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8FF960717
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 May 2021 04:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ia1mOWSn7pJO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 May 2021 04:29:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD29360668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 May 2021 04:29:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F2D9613BC;
 Thu, 27 May 2021 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622089782;
 bh=75h+mp2rqcuA/XzwQW6k+t62vCFe7ejRM0gBDE6hICg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unKWbg7lokqm4rkbpH37XLBX6i7S3aeYg2/OuTzXLcp7EUPo2yCPoJ3KXzLASM7PR
 /3JyJi72MZPhIm6f3PGDPoYSYsCLHwRcx5BWFeqCQONvCqVI3ayC5xvrh2+2rkScvv
 wYf0glhpgMrLyRIhL1ofURyzs8dpt7++74Sqlnww=
Date: Thu, 27 May 2021 06:29:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kurt Manucredo <fuzzybritches0@gmail.com>
Subject: Re: [PATCH] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <YK8gM6LoV8q8AkhE@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, May 26, 2021 at 11:40:27PM +0200, Kurt Manucredo wrote:
> Fix shift-out-of-bounds in ___bpf_prog_run().
> 
> UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> shift exponent 248 is too large for 32-bit type 'unsigned int'
> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> 
> Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> ---
>  kernel/bpf/core.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 5e31ee9f7512..35cba247c531 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1411,11 +1411,38 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
>  	ALU(SUB,  -)
>  	ALU(AND,  &)
>  	ALU(OR,   |)
> -	ALU(LSH, <<)
> -	ALU(RSH, >>)
>  	ALU(XOR,  ^)
>  	ALU(MUL,  *)
>  #undef ALU
> +#define ALU(OPCODE, OP)		\
> +	ALU64_##OPCODE##_X:		\
> +		if (SRC >= 64)		\
> +			DST = 0;	\
> +		else			\
> +			DST = DST OP SRC;	\
> +		CONT;			\
> +	ALU_##OPCODE##_X:		\
> +		if (SRC >= 32)		\
> +			DST = 0;	\
> +		else			\
> +			DST = (u32) DST OP (u32) SRC;	\
> +		CONT;			\
> +	ALU64_##OPCODE##_K:		\
> +		if (IMM >= 64)		\
> +			DST = 0;	\
> +		else			\
> +			DST = DST OP IMM;	\
> +		CONT;			\
> +	ALU_##OPCODE##_K:		\
> +		if (IMM >= 32)		\
> +			DST = 0;	\
> +		else			\
> +			DST = (u32) DST OP (u32) IMM;	\
> +		CONT;
> +
> +	ALU(LSH, <<)
> +	ALU(RSH, >>)
> +#undef ALU
>  	ALU_NEG:
>  		DST = (u32) -DST;
>  		CONT;
> -- 
> 2.30.2
> 

This looks odd, shouldn't the caller be checked before it gets to this
part of the code?

did syzbot pass its tests with this change?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
