Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626A1207A1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 03:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731380642; cv=none; b=CWhBlT7UuflhPliUfGa4L/qVi8LH3rI1eM7eE3iozXguuopYooJp9BYcv7sS6BmN10wgh4QXDdvup7h3z8rb4sCWB3hyV57V98tq9P+bf5OyixuEAO/Dar7hx/tN57Xe/e+TbpMwagailLwoz8g5w69Xtr7dglmMaEzJj0PSiU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731380642; c=relaxed/simple;
	bh=zEuVEOYuXvXUfujcZ5GqwkoABFSLMXkGDWxAsMEEFyE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIVIfovUUw6aGo4xTxYSSXFgNTyqueUW8gO038FO4QVOYTSaPhASwMQ7VwPdTozatb9X6t4BijnwCLt/mRifb63O9hkrh9O/UyQg9e1L+Oy+GViWAkMQ/9SMupQ/J9fL+epyfl0M8EtiDNw81gO/AGrWXufUI/6zDoU3SmSuWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv8wTLYb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv8wTLYb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C05401A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 03:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBtRujKZNXaq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Nov 2024 03:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BD0440002
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD0440002
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mv8wTLYb
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1BD0440002
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 03:03:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BC165C462D;
	Tue, 12 Nov 2024 03:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E022C4CECF;
	Tue, 12 Nov 2024 03:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731380638;
	bh=zEuVEOYuXvXUfujcZ5GqwkoABFSLMXkGDWxAsMEEFyE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mv8wTLYbB0/mepIUwLysLWZSQHKkWGgpvMXFU6/G85HdVDVTKuOTFLGFdZ8lHm1PN
	 gjzljxT8jQfbK2oQi4AwJfeNeMe6gcl8LWLwDttcFpDTEysNKxnpOAGAWVp89XLm8R
	 eVuH4Tpzdj1asuMS0pcb8r/DNNY59gjMasG1ZAHzYiJpjDjWdhHOpORXc+gqQEu2Vw
	 3BMkcFunnkZfW232l3DHw+y90hFNBw8+tOiaRSbMHJhrFUcLnijjpLF7Ab+Ul3HN7U
	 AnYMdTA1ZyLFxpPSlf5Ht5f686gvLoH1V0TnzUGdNtZ4cWa4Pp+jOkiMpo1mBq1cMn
	 PDgDB910rl6Bg==
Date: Mon, 11 Nov 2024 19:03:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan
 <tariqt@nvidia.com>, Allison Henderson <allison.henderson@oracle.com>,
 Russell King <linux@armlinux.org.uk>, Dragos Tatulea <dtatulea@nvidia.com>,
 Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: Re: [PATCH 1/2] docs: net: Fix text in eth/intel, mlx5 and
 switchdev docs
Message-ID: <20241111190356.0aefe1b9@kernel.org>
In-Reply-To: <20241108202548.140511-1-xandfury@gmail.com>
References: <20241108202548.140511-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  8 Nov 2024 13:25:47 -0700 Abhinav Saxena wrote:
> diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
> index f355f0166f1b..df4b4c4a15d5 100644
> --- a/Documentation/networking/switchdev.rst
> +++ b/Documentation/networking/switchdev.rst
> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>  monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>  bond will see its upper master change.  If that bond is moved into a bridge,
>  the bond's upper master will change.  And so on.  The driver will track such
> -movements to know what position a port is in in the overall topology by
> +movements to know what position a port is in the overall topology by

Are you sure? The first 'in' is for position, the second for topology.
Equivalent to:

 movements to know in what position a port is in the overall topology by
                   ^^                         ^^

We can rephrase to avoid the double in:

  The driver will track such movements to know the position of a port
  within the overall topology by registering for netdevice events and
  acting on NETDEV_CHANGEUPPER.

>  registering for netdevice events and acting on NETDEV_CHANGEUPPER.
-- 
pw-bot: cr
