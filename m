Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A57208B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj8eRfpf"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AB5403F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 22:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22AB5403F5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mj8eRfpf
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWOHyjNUgMRO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 22 Nov 2023 22:26:53 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 453A94037A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 22:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 453A94037A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2311BCE25E1;
	Wed, 22 Nov 2023 22:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBD2C433C7;
	Wed, 22 Nov 2023 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700692008;
	bh=WwfXqFdQODJ5eTAQRPCjbazPXFZyyOZtLQqG0NVTAI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mj8eRfpfYxI40HfwoISrzssx+kkuZA28UzQVDjZAc3lZ9iCJOMcbXgesxLQbEzNn6
	 u2RVu+eXC0ZBurldpJHEdydeXETb5MFr5lp0ZX2lrVQ3Jdga+H0cWALWU/aSsPLBxM
	 oHlVnuUYU3DKESBXE4PXBsMxvNmxGXO+T9wB/1cL2hF6yP1J/kv8qBsYb2ngsO35Ca
	 HKHh9M7fdPu2ehotCkRxBw1ZeK6Px2ZUn1Xwvwc1FjGU/OKXe6D0lsLa/QwYBGLFto
	 hVjkoDrkrNI1RryKQAjmhMsUuukS1H6TuZbBgI/+J91qZyqPkrCvLqggwlt2ftqJiz
	 wiSgMFuERNT7Q==
Date: Wed, 22 Nov 2023 14:26:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 jiri@resnulli.us, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v2] netlink: specs: devlink: add missing
 attributes in devlink.yaml and re-generate the related code
Message-ID: <20231122142647.570426c8@kernel.org>
In-Reply-To: <20231122143033.89856-1-swarupkotikalapudi@gmail.com>
References: <20231122143033.89856-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Nov 2023 20:00:33 +0530 Swarup Laxman Kotiaklapudi wrote:
> Add missing attributes in devlink.yaml.
> 
> Re-generate the related devlink-user.[ch] code.

Try running:

make -C tools/net/ynl/

in the kernel tree. The C samples no longer build, looks like there 
are some typos in the spec.
-- 
pw-bot: cr
