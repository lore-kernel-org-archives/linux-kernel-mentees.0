Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38412253F3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533117; cv=none; b=CzkguNqn4hupZqBazpyVW1TDsC4YRzbQUIDWiw05gYQuMsPhxutyjzfnnvhJjLVhl3kZY6gicp0V8frCaGhHQQV831YXPAIL4fYAW0CJApZcu5qxsgGANm0b0jpWxT8Ze9iGIyVrSYdK8vZdV+ukGsLcEQ3lBcyESxPoWp7BCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533117; c=relaxed/simple;
	bh=V4ib/RyN/mo0x8ar4U6LNfOgqaG+ll3syFHXRhRqc78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iHF14h8+lW7oSLHpcxQvfcUH1ux0wWKMQnj87PWRrcMI9VNqxMTi0cjMqv4wn9+4VLcXRChs1tCd1pYVS6ZVeKE9AmYphDk3u3XdiWvdFWU4qwVImyjq2ktaxRfhhOo5FyBgME7SnEAYcLulj2mMVQR07c5t4RbUykShdAPWjVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l7wsbnzK; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l7wsbnzK"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4B5940018
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UE-p1Zy_V7fS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 16:05:15 +0000 (UTC)
X-Greylist: delayed 365 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 18 Aug 2025 16:05:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 394C740012
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394C740012
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=l7wsbnzK
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 394C740012
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31BCB40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755532745; bh=ulSLL5IxO8lNYeCu4KSyTDz+mdlJ/nPyT5ffAzhI9Js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l7wsbnzKZcUsKHwwFbjN25OLyedEJJDuArat+exM21TgbJxSscElIb+416iKITzN/
	 19un5feqQC9LHS3tffDWtD1REYRhOlSOxfiD1iJdVNbmH8NIXBtpM9z/SR6v9YQY2e
	 gU86yEW2IQW7fz8Z8u18naH67KnW5+F/p5ScuUJSA8nIIoetP5BHhDu+G2y8TvkA/h
	 iozT3H/A84AyqGjwMmhf7em7Ag8j5R6GLXF5MTrEFDYj6jVY5iSRAruw4L2Yf+6Krf
	 1jt/ws1FJ20q8bILlEjwxYim9s8JC0v1EOYlj2FQx4nkvfFdi5oqSkF1Hi0AnIc+zj
	 DqcPpIMY4mu9w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31BCB40AB4;
	Mon, 18 Aug 2025 15:59:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org,
 Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
In-Reply-To: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Date: Mon, 18 Aug 2025 09:59:04 -0600
Message-ID: <87ikikaaev.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:

> Fixed missing definite article "states that the parameter" as suggested.
>
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 445248787e77..7bf8cc7df6b5 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that parameter will
> +a trailing = on the name of any parameter states that the parameter will
>  be entered as an environment variable, whereas its absence indicates that

Thank you for working to improve our documentation.  That said, there
are a number of problems to address here.

- The patch does not apply to docs-next, or to any recent kernel
  release.  Which version did you generate the patch against?

- When you do a "v2" patch, you should include, after the "---" line, a
  summary of what changed since the previous version.  That is
  especially true when you have seemingly just dropped one of the
  changes you made the first time around?

  Ah, I think I see...you generated this on top of your previous
  version?  That explains why it didn't apply.  Please do not do that;
  when a patch needs changes due to review comments, recreate the patch.

- "Fix a warning" is rarely a good subject line for a patch; you should
  say what you actually did.  In this case, "replace a duplicated word"
  or some such would be better.

- Finally, Documentation/process/submitting-patches.rst asks that
  changelogs be written in the imperative form.  I am not a stickler for
  that, but some other maintainers definitely are, so it is a good habit
  to adopt for all of your patches.

Thanks,

jon
