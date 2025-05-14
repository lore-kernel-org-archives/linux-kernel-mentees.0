Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104301487F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254515; cv=none; b=p7Xlh4xLh2f0Kh2i0vm9cijCM6/lA8dq/oslclnJaK+Dcu8sIepcn9o/d+3ewv2BHvGcSnhke9WYogFWn/O00J7kBUfRcdxhTablkddozTBSGMoBSBR95C0oV2BOrvEDiNgT1R9U5Y6C63m7MNwYN/xhTwBuHtxMNLUUNZH+X90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254515; c=relaxed/simple;
	bh=p4O3d8Z4/Z4owD/WPv6OUNS8/hMMidt47hnYPaQYdn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEJVQfo4fwG80x5iwyOHiCowCKGjT2EGnmw8Lfco3nmKAgdbyfVGNTtU+hddO6DHZTyjCPxjbIFB4P91IfX9GmcSrZrbDw2fJsM0elq7DoPctvQUkcX3nRZQda8dujRcmsezH3YfGCGy3x5zmeXp2vdiFGdB1F6vg6svKx50Ezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C95981EC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.342
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkckTRs5q5-v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 May 2025 20:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=h/be=x6=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 339AC81EAE
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339AC81EAE
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 339AC81EAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:28:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6179F40C17;
	Wed, 14 May 2025 20:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7051AC4CEE3;
	Wed, 14 May 2025 20:28:30 +0000 (UTC)
Date: Wed, 14 May 2025 16:28:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] tracing: Replace deprecated strncpy() with strscpy()
 for string keys in hist triggers
Message-ID: <20250514162857.4a3f846a@gandalf.local.home>
In-Reply-To: <20250514201956.1447439-1-devaanshk840@gmail.com>
References: <20250514201956.1447439-1-devaanshk840@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 May 2025 01:49:55 +0530
Devaansh Kumar <devaanshk840@gmail.com> wrote:

> strncpy() is deprecated for NUL-terminated destination buffers and must
> be replaced by strscpy().
> 
> See issue: https://github.com/KSPP/linux/issues/90
> 
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
> ---
>  kernel/trace/trace_events_hist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> index 1260c23cfa5f..90a4e486fba8 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -5225,7 +5225,7 @@ static inline void add_to_key(char *compound_key, void *key,
>  		if (size > key_field->size - 1)
>  			size = key_field->size - 1;
>  
> -		strncpy(compound_key + key_field->offset, (char *)key, size);
> +		strscpy(compound_key + key_field->offset, (char *)key, size);
>  	} else
>  		memcpy(compound_key + key_field->offset, key, size);
>  }

Incorrect, and this is already fixed in next (at least it's in my ftrace/for-next branch).

  https://lore.kernel.org/20250403210637.1c477d4a@gandalf.local.home

-- Steve
