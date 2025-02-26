Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487DB238150
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558747; cv=none; b=fIYk/J4lL+dsfWakBQogf8o1A17Vs8CoKyVysQQ7BZbXAlnGHKJoJJc6ZLzJ1m996neuDi+EUuGQ7/i4ydIAzyDS+I/9HXSE+okG2Ap1XqmDMuBRIctPYf+nm8ORQEItDvzJkgrpT+FIXA9xBDUdDlyHECaowct3hKbWrLoef98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558747; c=relaxed/simple;
	bh=pCY5MJcHID/t2Pb6RIB298aS9Enq1BhXl+cqd9OOkmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETUNkmXzLFRHmIKNfvP2pr/cITIhaFie5upARzoqbV8nlKE+tQo65AyooByaOlYQtt2X9x67+jNblpyh+gdLEvHG6aV0ZoQIU510GNiJz/Ng+Fn325NAe8y2ODANcOKOYoYCgqDr9T9N5WLn95WcyYE8UcdwDIEdn9oQPIaSf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkYkbob3; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkYkbob3"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E196F81EE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 08:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN0HawwDC2g2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Feb 2025 08:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47A3381EE1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A3381EE1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WkYkbob3
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 47A3381EE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 08:32:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 800B961295;
	Wed, 26 Feb 2025 08:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5E8C4CED6;
	Wed, 26 Feb 2025 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740558741;
	bh=pCY5MJcHID/t2Pb6RIB298aS9Enq1BhXl+cqd9OOkmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkYkbob3F/FEh42Rx8pbhLsqPxB9WOaFobE/EZjopEvktMV32lK3zQohLNTQSZcTt
	 0OeayTHGLe4FurZoLIdV4SVa3zXNM8J6OLEvEHp3bbwozERqQUTFCFL7dtqsbI8nMT
	 713eIKNYQ3nnXqP55Dac+TorJINYr83Z+WEqa4b+l9CHVToDRtNgvXGQtt1w9bg69E
	 1Ezzu+aC4FSlJThngdeT4GGupXNlOb7grliknak2jIBrSeTjGMR6T76D19k/sYGjm9
	 /eAmCMtM3WUFuGJfvuXmDpEvLew3EijXa2xCespHGV+XTzX265tK+qJ4SqOFS8mcR8
	 PcaXURSBZ1www==
Date: Wed, 26 Feb 2025 09:32:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, vz@mleia.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 nxp,lpc3220-mic.txt to yaml format
Message-ID: <20250226-khaki-wildebeest-of-action-ddec48@krzk-bin>
References: <20250226010956.50566-1-leo.fthirata@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226010956.50566-1-leo.fthirata@gmail.com>

On Tue, Feb 25, 2025 at 10:09:40PM -0300, Leonardo Felipe Takao Hirata wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,lpc3220-mic
> +      - nxp,lpc3220-sic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    items:
> +      - description:
> +          IRQ number.
> +      - description: |
> +          IRQ type. Can be one of:

That's not correct. Previously you said you have here two interrupts -
SIC1 and SIC2. Now you say you have one intrerrupt "IRQ Number" and
second interrupt "IRQ type". This makes little sense - your interrupt is
not "IRQ type". Unless it is an interrupt signaling that other interrupt
has type?

Look at other bindings what are the interrupts.

> +
> +              IRQ_TYPE_EDGE_RISING = Low-to-high edge triggered,
> +              IRQ_TYPE_EDGE_FALLING = High-to-low edge triggered,
> +              IRQ_TYPE_LEVEL_HIGH = Active high level-sensitive,
> +              IRQ_TYPE_LEVEL_LOW = Active low level-sensitive.

None of these are relevant here.

Best regards,
Krzysztof

