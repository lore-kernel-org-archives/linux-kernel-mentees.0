Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D91EB9F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764439130; cv=none; b=rvEK4AmsLh1c37hbQ19xJxsUwity/PwTyInCxTbPd/hEo5bdILd/hXpLK9dfd5lSg8gL3EzfHtxTBK0vCMmxfPkwNZQl2Ew1m7BYXqcExfIfEKxg05A+YjmYAw033WCNpapvhwTPV5X0cewVLcUAcehoncu8eKCKW89UqA1sJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764439130; c=relaxed/simple;
	bh=PXsvXs0P6QIHZFy8DIQsKir+mPzceZIj16cevjs+9gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhdyuGA0Di3WCL2qSlpHoYYUT75Mw8uejwDUpj9DLeh5Um+NFrDUcvWe33xq0N6Tw/ny4lEB+gGaiPWclM6QvhtZbUuOwwsReLwxPNzVdrRQ8CGIHBy2izYljXIm0xyjaBOOfwWRpLCklYz8A48M5Qm67YNsRX7b/q/Z/sqqoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtsPuylX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtsPuylX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A22B40379
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 17:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iS69nPzzRO0D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Nov 2025 17:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F76440376
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F76440376
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dtsPuylX
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7F76440376
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Nov 2025 17:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9908043913;
	Sat, 29 Nov 2025 17:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07B6C4CEF7;
	Sat, 29 Nov 2025 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764439125;
	bh=PXsvXs0P6QIHZFy8DIQsKir+mPzceZIj16cevjs+9gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtsPuylXljK9+V9ak7L2qdVNX3VyHRic71Q6+gid/ahI3d809Pj7ZCbDfsw9YhwJD
	 nEpEbkXRlIXWCyDyGLPMlZm/LAv4kNb7CN5C0WPhZODGl54QQPPO6+HqrJr9ZAGGBq
	 CBTpMa/E2PwbL/bfFvyHYasXdQXf7qI7mHiNDii7wBJgt26ZJsuFCD2j0KqX/4rbIf
	 nrdnjYYFIjO2FfaErvXbxDiI9XzrQfBQ4mIQY+zyds4GrjUBeex48ulKoxhVkzCEWr
	 BVyQ43a+gaKDgtBPHtS0/QzY2JsIQDbo7dHti32r5hzXbLWl2LAC90FoaFeKXTtLcR
	 mWy3blFXbPw5A==
Date: Sat, 29 Nov 2025 17:58:40 +0000
From: Simon Horman <horms@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next] team: Add matching error label for failed action
Message-ID: <aSs0ULj4jaPxjCcW@horms.kernel.org>
References: <20251128072544.223645-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128072544.223645-1-zlatistiv@gmail.com>

On Fri, Nov 28, 2025 at 09:25:44AM +0200, Nikola Z. Ivanov wrote:
> Follow the "action" - "err_action" pairing of labels
> found across the source code of team net device.
> 
> Currently in team_port_add the err_set_slave_promisc
> label is reused for exiting on error when setting
> allmulti level of the new slave.
> 
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
> Related discussion:
> https://lore.kernel.org/netdev/admyw5vnd3hup26xew7yxfwqo4ypr5sfb3esk7spv4jx3yqpxu@g47iffagagah/

Reviewed-by: Simon Horman <horms@kernel.org>

