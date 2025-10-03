Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E4248F4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759476812; cv=none; b=B725SGCn/1GFLdi2u2c5pcglh5nhxb9Eh5/U1vW6rp/XMhSE+vc5eHBmV5MU3I0+kS7E2mvDW7UQi7lAXBlVdWFEEesOTfMal6aEMUTSjCcH1PC8JFhawjGOz1rGHB7A+Dg0rRVHVRA3imeJc+54GxRCUuse0ARcWjTyLJ8qkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759476812; c=relaxed/simple;
	bh=B4tE9QKrxptfIX5Q80EK++1ZwvbcKDyl6d3JAR58kYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAvVvL9Zahx88D+/msffLqNsS8QV0Q5+6KOg/gXrFtoXw4jJmYyA5Dt0F4EVZZ8+hXx/HUggxK/HEPnkXHj3xpi+a8bgcjyBIJ9gXDu0g5WQSrWiM7WaXIgW6jqRMl0FUkiCZ0+E5gcKhvWfGmxP6rSYmNeZy4L0XFYs5OrBzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yfqz/380; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yfqz/380"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB7CD81D2D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 07:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE8PcIIdrxrR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 07:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0057B81C11
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0057B81C11
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yfqz/380
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0057B81C11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 07:33:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45F13454C3;
	Fri,  3 Oct 2025 07:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0742CC4CEF7;
	Fri,  3 Oct 2025 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759476809;
	bh=B4tE9QKrxptfIX5Q80EK++1ZwvbcKDyl6d3JAR58kYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yfqz/380QdLUyU2l8Kjh+C0qekBfRS3wt8evAZ0Y0QZaIjYltFbPiNWZYtJJgwDEH
	 BLCrDcf3IuR+NrHsHOVb8V5lNbA1PjsFBW2AJaXV47fROM8qJK/PhX8EwQJEC0q+Nc
	 0ijQeiR26fdx7X8i9R28t7IFrU+s63rJj0+Ure1uqUaEEtrmWSvlbXyvND/PF+Z+Fh
	 YDQ+PD8+NxuMkecatTl1ZRwZFrNyylGFm5b8nfYECYVa+xGe51789Us2V1Yj79tXt+
	 EsLtDiuMNPdcHIbxWy34kVDUwePYiw3RsIxfEdCgn13whq5EM2V93wncGiOPkl4k+W
	 6GHqKpMgRZySw==
Date: Fri, 3 Oct 2025 08:33:24 +0100
From: Simon Horman <horms@kernel.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	david.hunter.linux@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in
 fsl_pq_mdio_probe
Message-ID: <20251003073324.GA2878334@horms.kernel.org>
References: <20251002174617.960521-1-karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002174617.960521-1-karanja99erick@gmail.com>

On Thu, Oct 02, 2025 at 08:46:17PM +0300, Erick Karanja wrote:
> Add missing of_node_put call to release device node tbi obtained
> via for_each_child_of_node.
> 
> Fixes: afae5ad78b342 ("net/fsl_pq_mdio: streamline probing of MDIO nodes")

nit: no blank line here

Slightly more importantly, although the code you are changing
was added by the cited commit, I think that the bug existed before then.
I wonder if the fixes tag should be.

Fixes: daa26ea63c6f ("Merge branch 'octeontx2-fix-bitmap-leaks-in-pf-and-vf'")

> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

One minor comment on process: as a fix for networking code, most likely this
should be targeted at the net tree. And that should be denoted in the
subject like this:

Subject: [PATCH net] ...

And if you do post an updated version, which is probably not strictly
necessary, please be sure to observe the 24h rule.

See: https://docs.kernel.org/process/maintainer-netdev.html

The code changes themselves look good to me. Thanks.

Reviewed-by: Simon Horman <horms@kernel.org>

...
