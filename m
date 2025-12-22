Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AFA349AFF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Dec 2025 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442314; cv=none; b=iC93qi7D+HmF0ggzuSxOkKBA5R/rN+jd8T6vGsn003SmX2c/XB8VgotSDom3vgvqEmiEQ80IEBjUS6c7gbGiNqi7T8jxCeybof36PkJEHqOUxquFLusZssm6sRzMnz/w+vMJy2jmt+/yydXeVHM16fZlsvYur5dGszMpVLgN2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442314; c=relaxed/simple;
	bh=UTE3e3zRqag9whWqOByHRu2cmId+V2NVcCFEvxb8Pwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHAftgI/mxh2OuuvAZFm6SHCB1EIs5TlnsgiB9QC0rk07GdkMuCLUjNjSC7AShV+iEufpSEW5QaQWaBFerNjB1nSJpHtMlhcPR+EYDya+5P7pUT+RZH2231US1U9PfFGKFuQLwnZva0PJ+yLu3s9wp070ug38I/ejEaR5PjerOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nOIe/MqV; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nOIe/MqV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB11C810AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Dec 2025 22:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdbLNqs2NekB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Dec 2025 22:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDB9381063
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB9381063
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=nOIe/MqV
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DDB9381063
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Dec 2025 22:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB9374040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442310; bh=H6dkgP5nDXtUY2fgbr9pLhBkMHgH1gFtdMcuO2qFves=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nOIe/MqVOXG8sSpS7Nhg1Vg9qTrnZcIn6lRCysA8sOU7noG7oOuhWJznFlKKj685L
	 ge78hG/BNeud7+BRNwcKL1xS66LFc/Y7fmswL/BCf1MEjDuYCRJazYTL0MtgjTXUQT
	 Y1v63S3Zn0d4Cq8nFPhFnPrDjHoo0E2/szdeALIzIKT3t1dUCxOAfoAiv2VxGfF7Go
	 hXhD7dADEwbFM/l3kLB8ZwDGY5yreyaTRUvSa+gXVCxgJ/I9wZIntLpm2FjarJHE4c
	 TUgXHFF8uLUVJB7Fs9RPmwuV/N+eGyNbwyY6SFMc8cvNdSvT1QzQBUWyoPMe/MB+2P
	 yQKE552y6uH7w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB9374040B;
	Mon, 22 Dec 2025 22:25:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: Soham Metha <sohammetha01@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 skhan@linuxfoundation.org, namcao@linutronix.de,
 mathieu.desnoyers@efficios.com, mhiramat@kernel.org, bagasdotme@gmail.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
In-Reply-To: <20251204101415.284a7a96@gandalf.local.home>
References: <20251204032452.9523-1-sohammetha01@gmail.com>
 <a34546391cc59f9f880ec271292ac201292bac61.camel@redhat.com>
 <20251204101415.284a7a96@gandalf.local.home>
Date: Mon, 22 Dec 2025 15:25:09 -0700
Message-ID: <87h5tiyx16.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Steven Rostedt <rostedt@goodmis.org> writes:

> On Thu, 04 Dec 2025 07:36:57 +0100
> Gabriele Monaco <gmonaco@redhat.com> wrote:
>
>> Anyway looks good to me.
>> 
>> Acked-by: Gabriele Monaco <gmonaco@redhat.com>
>
> Jon,
>
> Care to take this through your tree? Gabriele is the maintainer of this
> code.

Done (finally).

Thanks,

jon
