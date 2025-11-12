Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6823184F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762910027; cv=none; b=vAVRNZGITHrJ6IJRM7ggWSMB3UVfXIsxJeEcP4kJUvQY6wyHhVwGHpgQdf/P5xRwGF74C9vnE+1Ti6gypM8z0QN8NGM4imfR2aCn4tOh4+BvIZzF8I1N1hZg1eYoPEFNwvNVAoddXr7qOTtg6t3mmUrI17miklJz2BkC3lcdwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762910027; c=relaxed/simple;
	bh=oDl1WfrAghq+RE9pFio7UD5bjLDfO6Rlsgm4KgrcWl4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPubXC+senlMbrWYtz1jrS40G5c64hUCUvvsFdZKxOW0gIvlIFwZV94E6DzsoqY+boIDxAs1ulxihwZheUfvmwl0Fmoq9Yq2iw56Z02+CPIio7W7VlVhgkCsp03b649hgNc7ip0VAPGq7q40c8/GkhQqP8JXwBbizt2qJLkzzdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfj0GrFe; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfj0GrFe"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4640814C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 01:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCiQCr9BjZli for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Nov 2025 01:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAC9B814A1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC9B814A1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfj0GrFe
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DAC9B814A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 01:13:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA15B44160;
	Wed, 12 Nov 2025 01:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B04C4CEF5;
	Wed, 12 Nov 2025 01:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762910023;
	bh=oDl1WfrAghq+RE9pFio7UD5bjLDfO6Rlsgm4KgrcWl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rfj0GrFe/hv7wIbYG9qd9byNFSuj7ayLnIGNwAkNADVc7oNrOLtZrrnz/hoQ6ODGI
	 phdKmiLSry0/IkvyCxN7WyY8eQS+TAIJxP2P4gx1nXVGwCm46CvCdyEHBkABEy37SY
	 NbvKyrNAz1yonoh1SCJcTm00ccmjeiuKKFb2K686WJ/rPnqD2fSZDo121GFoNKZDC3
	 OLmIuaB1MNlBBKNdhoq9DcK3uRhQNHvtFwLkOEQWrZFmdTOuzkHaHldrwJ1ku6Iii8
	 l4uzpXbhRtOgKEivbZye67n5ky4YBZ1TSY7SZyqdfmxO12VoSTllOxRvgKuzIIVvQ2
	 aSqTD8/vkRZNw==
Date: Tue, 11 Nov 2025 17:13:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net] team: Move team device type change at the end of
 team_port_add
Message-ID: <20251111171341.4c6d69be@kernel.org>
In-Reply-To: <20251112003444.2465-1-zlatistiv@gmail.com>
References: <20251112003444.2465-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Nov 2025 02:34:44 +0200 Nikola Z. Ivanov wrote:
> Attempting to add a port device that is already up will expectedly fail,
> but not before modifying the team device header_ops.
> 
> In the case of the syzbot reproducer the gre0 device is
> already in state UP when it attempts to add it as a
> port device of team0, this fails but before that
> header_ops->create of team0 is changed from eth_header to ipgre_header
> in the call to team_dev_type_check_change.
> 
> Later when we end up in ipgre_header() struct *ip_tunnel points to nonsense
> as the private data of the device still holds a struct team.
> 
> Move team_dev_type_check_change down where all other checks have passed
> as it changes the dev type with no way to restore it in case
> one of the checks that follow it fail.

Since this is a bug fix it must have a Fixes tag pointing to first
commit where the issue could be reproduced.

Please make sure to have a quick read of (at least the tl;dr of)
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
before reposting.
-- 
pw-bot: cr
