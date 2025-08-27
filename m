Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1272610
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292769; cv=none; b=ZFwMdg+8dpBbiySUPYEM8i0zOGLIm0v7qQcFloZ1y5Ftf2EN7ONy1T0Y9c2dYtAoID3OtbiVgPAeQZKNWJQM8MsnhS8IdjGd1EJl9GQ10w1Tpp2/DwZg2HmrNamjNDAKk4/Ix33Pe+ri7PRyRydY05rztn0vVgcl3lsmPUQHXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292769; c=relaxed/simple;
	bh=089uvcPzKEMjllQfZC9ze5HF4s61d3lApct5f3CcAVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJTiotl4ehf4mZfl7IkFHFaoBHHsOL3lpdb6VW9Jy0Wp7ASCxWFAf/XEPjrCytyLkzT2T6TJ+PvNe0pjSNlO3XESguGGcJbe1OUiD4XAPstSF43DZUDV5IoGOtJmGY4Np0fYrLpruqW6rPeWHYom3gTv8WF0O2BWGesQIuiA3AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E4v1qubR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U8TFjCj/; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E4v1qubR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U8TFjCj/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8985406DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.092
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1cqoyK0oedn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 11:06:02 +0000 (UTC)
X-Greylist: delayed 348 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 27 Aug 2025 11:06:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F99240B2E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F99240B2E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E4v1qubR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=U8TFjCj/
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN> 
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6F99240B2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:06:02 +0000 (UTC)
Date: Wed, 27 Aug 2025 13:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756292410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Pjc2TaTel/23f5s8SPnvNOw2jZdg7VRa902XINe/Y=;
	b=E4v1qubRYMYwkK4/AZdUy9rzDhRE9JkUOMtTv5TmHv7mLe9FsEKdSLe1ZjdXEUWpyLI8Nx
	ZzKOXsGMQhqbTdTT0N4/LT2nMwkZgLXxMdnMxxREu47/+Ls3MEhKI7Fb9MijbbYJHty3YE
	ZhpAP3/z6glnNSopiAIWGHQXfGq6927I7qFTnZ8h9n5z6OWpuTmvuCIzsIW8S6t8ILoGiQ
	40GkQsfAl36ysXBwAkosf0vH6JwVAHcZ7w9AzPr+1vAw3RBYcP4enkTAy7ir6mnIjvHwdW
	ItbF7H5H4QjD2JOnyxLGLHzE1KvG23NNcWIr2ZZxOvaKaph7lnOzNcaA/QJtxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756292410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Pjc2TaTel/23f5s8SPnvNOw2jZdg7VRa902XINe/Y=;
	b=U8TFjCj/Gd3JWBpo5tqKnTYOiZGM/WASjwFoe9mF31X9n5uSr463yIYSjBLcm1NSdI9NMe
	K4uL+fLUJLOU5MBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: bhanuseshukumar <bhanuseshukumar@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, shuah@kernel.org,
	peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
	andrealmeid@igalia.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	colin.i.king@gmail.com
Subject: Re: [PATCH v2] selftests: futex; Fix spelling in test messages
Message-ID: <20250827110009.H96ue6JM@linutronix.de>
References: <20250827105639.19156-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827105639.19156-1-bhanuseshukumar@gmail.com>

On 2025-08-27 16:26:39 [+0530], bhanuseshukumar wrote:
>     Correct few spelling mistakes in selftest output messages to improve
>     readability
> 
> Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>

I am picking up patches and this got already fixed.

Sebastian
