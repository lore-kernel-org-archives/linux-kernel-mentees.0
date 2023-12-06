Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A67D27D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq64Bb7Q"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9379582C9C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 03:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9379582C9C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mq64Bb7Q
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3pozA67zvyc
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Dec 2023 03:19:50 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5F23882C98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 03:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F23882C98
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 438EFCE1B7A;
	Wed,  6 Dec 2023 03:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33062C433C9;
	Wed,  6 Dec 2023 03:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832785;
	bh=qazZjGvxESECPn7UnTm0gAKB5GVROhpZtoKCBMJdlf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mq64Bb7QpK5vWSjzSS9lPdiPM36ZaL19wSEK7MQroYIYFJuFiXXDcEdDEX1ay3/zK
	 dP6WmPwHxxKPX3LQ2t68P3EQkopt9p7RP6pjfFZHXGD6KifWBX/bRPFw15ABM5CM2a
	 MQKqWgbxXKH8mnwnLG78gQCsqPfU0RVKsS2cAS1GR9COmG4vrONfk37E98DqKJmmc/
	 TEP0qQUC30L8ah9SlnCweZBcLEARgd+1w+BlC7ut7U5OoOQxGogCAfpRa/C38i+3kJ
	 Js6gFOl6wUk+L25rxxWkjuY0aG/d4pz2GROJ4Yaajv1/c2BJ8mk45Z5H4v4mpcU6Cn
	 nn6++EUwtdn/g==
Date: Tue, 5 Dec 2023 19:19:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 jiri@resnulli.us
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <20231205191944.6738deb7@kernel.org>
In-Reply-To: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  2 Dec 2023 18:00:48 +0530 Swarup Laxman Kotiaklapudi wrote:
> Add some missing(not all) attributes in devlink.yaml.

Hi Jiri,

Do you want to take a closer look at the spec here?
Looks fine to me, on a quick scroll.

> Suggested-by: Jiri Pirko <jiri@resnulli.us>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Fixes: f2f9dd164db0 ("netlink: specs: devlink: add the remaining command to generate complete split_ops")

I'll drop these when / if applying, FWIW. 

Swarup, for future reference if there are comments / changes suggested
during normal review process you don't have to add the Suggested-by
tag. The expectation is that the reviewer will send a Reviewed-by tag
themselves at the end instead.
