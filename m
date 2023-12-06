Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493445C07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU+BbgYg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62B2D403D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 16:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B2D403D6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lU+BbgYg
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEevfMfkU_jF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Dec 2023 16:06:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7F1CE401AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 16:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1CE401AD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 25636B82276;
	Wed,  6 Dec 2023 16:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E08C433C8;
	Wed,  6 Dec 2023 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701878772;
	bh=vwrPo6C+GvGv+sbHewNPX/1/OUd6kBvQMn/2KqnHel8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lU+BbgYg2IE0aLbJlELU7tYn3OPLJbqCY4T7BZBuStoVN0LBpRlsQnG5+I5x7hdJ7
	 61+sCQj96bP+tbqn6qQngK6f317uPtNzwCfeiWzmJsyY4e1wKs1eNzgVDTDx/usYBQ
	 l9cue29SoinwLvjLL8EkW/IOpWdV6/jCiazOiWZc6vTY9tQKImjp11D0/kaZZuiIBo
	 Nc4iznv95R3E6wpMpphd9QKTLhsTjHj2xGuAKAQnNnBUgoQ0aEZicgYrJ6TkOi7E65
	 aRIBLm/fP2QN4jPf4ll6ZefyXTQ3lbMKzVPSzYGA+VAzygwcNMbUP6K7/Kj5U0OWuL
	 +t05nCyq1AIdA==
Date: Wed, 6 Dec 2023 08:06:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <20231206080611.4ba32142@kernel.org>
In-Reply-To: <ZXAoGhUnBFzQxD0f@nanopsycho>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
	<20231205191944.6738deb7@kernel.org>
	<ZXAoGhUnBFzQxD0f@nanopsycho>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Dec 2023 08:51:54 +0100 Jiri Pirko wrote:
> My "suggested-by" is probably fine as I suggested Swarup to make the patch :)

Ah, I didn't realize, sorry :) Just mine needs to go then.
