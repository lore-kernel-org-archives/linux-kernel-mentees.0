Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627E30E830
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755799167; cv=none; b=JkK1hMIDMkSxDJeXasPiPB9jWDXViV4VGuUDexv6CtXBh4aB0YpRneJiUrwCzcr/PcLL7J+a4Hk48qJAjEJLfxTSUyq57Q1gMeoTuvP1oTAdjx9h5H+toaD3kf5UW+Dh0DEP+UlCSes5eXOrx5dgZsRv1DytVPvE1NV4cf78/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755799167; c=relaxed/simple;
	bh=QyvN0chavbF7pHok0nk/fd8jnLoH9sTCzcEOhaPLj2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fjMIvRn02MlkM3fRfZLnPN5sdh85Qjkpi/m23XGpI7nWaGxCYdZKcHEWhJoKGe5vjeg2nVQc/JghAW4PR0VTVWaVknHYQUCnCNccvhqjSrjuCFuVG/vVMbS4xewGmJ3/k4982pXwORFEGL2MTNMPTDvQC9eeWiLmIKjdl3IvCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=A0UoMTOD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="A0UoMTOD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EFDA40CBE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5CSc2h2y-50 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 17:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0776E40A30
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0776E40A30
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=A0UoMTOD
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0776E40A30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D699A40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755799163; bh=CJCSwL0zZ8uZbHkPUOPzTdq4BfEPTqZpTH09dUEDAqE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A0UoMTODod0NJhM7kPsgHwqFd8QubuK2DFfPq9tEtVGyJLZ8m8CkhLXCsmDonfCph
	 rYL05V68W7NdAGGYnW0QajDabQohYGWtl+6OsbLUWn9WmP9jrax+zg2mXCf02S5eQs
	 E+dYpWtmnvZtOtRiNYx4WHKN37cl+0RxNnfCK+j2xntdR6yxkfS3GnE9Apyj6e+q0D
	 l+/27rRT1U6hoZGy8sfHUhil5bLTTfFMI4/RfkX8X2HttOkt7g+yxSPueh5VzzoCU7
	 cgNazUzQVxiFilXfmfngZVTbI9BcwIy24Um+gy/gWwrYvWyONTAvwfAx407hOxi4JA
	 Eqeojr569XB8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D699A40AB4;
	Thu, 21 Aug 2025 17:59:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org, mhiramat@kernel.org,
 rostedt@goodmis.org, Mehdi Ben Hadj Khelifa
 <mehdi.benhadjkhelifa@gmail.com>
Subject: Re: [PATCH] docs: Corrected typo in trace/events
In-Reply-To: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
Date: Thu, 21 Aug 2025 11:59:21 -0600
Message-ID: <87bjo87dza.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> writes:

> -Changed 'Dyamically' to 'Dynamically' in trace/events.rst
>
> under sections 7.1 and 7.3
>
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>  Documentation/trace/events.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
> index 2d88a2acacc0..18d112963dec 100644
> --- a/Documentation/trace/events.rst
> +++ b/Documentation/trace/events.rst
> @@ -629,8 +629,8 @@ following:
>    - tracing synthetic events from in-kernel code
>    - the low-level "dynevent_cmd" API
>  
> -7.1 Dyamically creating synthetic event definitions
> ----------------------------------------------------
> +7.1 Dynamically creating synthetic event definitions
> +----------------------------------------------------
>  
>  There are a couple ways to create a new synthetic event from a kernel
>  module or other kernel code.
> @@ -944,8 +944,8 @@ Note that synth_event_trace_end() must be called at the end regardless
>  of whether any of the add calls failed (say due to a bad field name
>  being passed in).
>  
> -7.3 Dyamically creating kprobe and kretprobe event definitions
> ---------------------------------------------------------------
> +7.3 Dynamically creating kprobe and kretprobe event definitions
> +---------------------------------------------------------------
>  
Applied, thanks.

jon
