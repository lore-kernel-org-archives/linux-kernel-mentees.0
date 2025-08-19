Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBE28504F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755623887; cv=none; b=ah2+W3KolgKFTRctMgan9dM1IVZWpTuNQZehYgdQ3WKFT0QKw8VjIV1cbVVjcYlIBgBMxdhdf7RTDr9IUHdpxeA4Rkv3594gv5yvQTgDSkTGxyHy+NDy5pfBlTS5l8FyXkItRjOWbHzSSolM3plfnNYCkjs6ae1MHCSZ9vNKwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755623887; c=relaxed/simple;
	bh=y1gn1ppItBT617iahNUSOTZgBrO3Bemxe7cvYxvwW40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUF8ckKHtgPcaCuBRffJWKxlmkg/hkL3W2jyp1ihT6RlMoeXA8FpyDLIQXneThUs3L648awJkX/4itIJ4dpnxZzSOsf/vUC8lTzGY72pT/QoMQPljtfEsiRexqFtMhkLwkN7hemijLvx/DACsc/lLaAcbhgbbea+uWh6GVtb0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S5hyOat3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S5hyOat3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6515B608DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV45Ne4nPoXh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 17:18:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3CE2607FB
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CE2607FB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5hyOat3
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B3CE2607FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=k9T40x/ryGpUQ+rzosuC/CwY1mQ6mOTPssvplMLxzqQ=; b=S5hyOat3F9Jn4VPib3g33Aa51X
	8uyAL+EX5AjjqOkt3IL/YTNdbc64xw4I8jHAGf7ZIc5mFPYqRXvA33pEtaicW9cXJbroan14BbNjC
	D52IneFLVo/MFGY1A75ChVFA1L+PkFgPP6Xi0dmtc6YAViuKaqNkveMbmsCGyH5MTtJLc4imNeC4r
	rt20n3kEgCXtk/UbPXQ1aT2dmjSHNw8mqhkoV2t0R6fPsUDXWB2N4LgFXvQe+UzqUt7yEQZpxZKsM
	FGCoidSZB2jxco10AsO2N31RXWxHN1yd4Nt8ZG829xRAuKw6TSSetTAToKDypOOC7uBZ4B39RycyV
	9GwY/X5w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPyD-0000000B5HL-1ezR;
	Tue, 19 Aug 2025 17:18:01 +0000
Message-ID: <d14df81f-989f-4467-aa0c-5c65009fd66d@infradead.org>
Date: Tue, 19 Aug 2025 10:18:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Corrected typo in trace/events
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net
Cc: linux-kernel-mentees@lists.linuxfoundation.org, mhiramat@kernel.org,
 rostedt@goodmis.org
References: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/19/25 1:49 AM, Mehdi Ben Hadj Khelifa wrote:
> -Changed 'Dyamically' to 'Dynamically' in trace/events.rst
> 
> under sections 7.1 and 7.3
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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
>  To create a kprobe or kretprobe trace event from kernel code, the
>  kprobe_event_gen_cmd_start() or kretprobe_event_gen_cmd_start()

-- 
~Randy
