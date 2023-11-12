Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42518E27
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfO+rUz7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 909F14011B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 909F14011B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DfO+rUz7
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJn4z4pNn9XO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 20:46:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF9C240131
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF9C240131
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A26A360BEF;
	Sun, 12 Nov 2023 20:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF891C433C7;
	Sun, 12 Nov 2023 20:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699822010;
	bh=x0KkQ1m2T4l955l+iWWR5hquh3Dkov8vMg7UiKT33uI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DfO+rUz73wPcCwOLrLdtqYrcPdvKiP/M621/K3I7cCtxdIbiU3lvTlBL9f3cBwvx5
	 qVyDkmrp4Ny49ub19su+2Tu8izIbDuDLTbxJkfTDT26UK/qm4F/TfJckknMuKIkLut
	 qRWwBGn+il8ik6TrCzM4+P2kc7GTIdCOayfEGhYlNRy9EMF8lL2PxXBcOhOatHIm8O
	 C6FjX6+1LyBS8jYCrLG/okAw6wd0A9frPg9LtB6gPvdITM24xK8jcrbZZOdL9Zp+zs
	 1HiVKzdGg2Zqe7w760K4d1Kk3dlZoKF9CAMy04MtREPOjdgyimBueKdxv4ODVB6LLT
	 2eAUogtvJNubw==
Date: Sun, 12 Nov 2023 12:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 jiri@resnulli.us, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] netlink: specs: devlink: add missing attributes in
 devlink.yaml and re-generate the related code
Message-ID: <20231112124648.2e11ec25@kernel.org>
In-Reply-To: <20231112092352.20072-1-swarupkotikalapudi@gmail.com>
References: <20231112092352.20072-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Nov 2023 14:53:52 +0530 Swarup Laxman Kotiaklapudi wrote:
> Add missing attributes in devlink.yaml.

For merging you'll need to repost CCing netdev@
