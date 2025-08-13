Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0552F0C77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075579; cv=none; b=AqTnqfRi/cYZzasT15GZxW+5yU4PODEKPFgP00I6VMQNyuUpfnOUSKRqV/yXMZyoOUORL18ma/CnYvaAMSxMCAFsfDPYazvEKxLK0ypjt8uL5cTdO0/CmYjH7vPJ97F0EYlaF7wkzLKMxhipC12Usk22rnobkilQCavWOZVbbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075579; c=relaxed/simple;
	bh=XmgEE2r9/03Htllgcwpg18c5MfZ8FEI0JOAF6sFxxKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SB45WTbW3bo/eYq6kJHaseFMiVzf6r4znb21ZeaECH8sWq33RFV3r1VAQXWhwNGf7ThtyCpdH9m/qb94GNL8wrGoThHWTdGProHpp7Fk8TiUzZUPlak9pG79do7Jx3MSL2OMpk5bHByA+QY32GAxPuYJT53xRjkLRNVKP6R1PBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFu5YI9m; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFu5YI9m"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8994A412E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 08:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vgx_rYbGg2FT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 08:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00F7740F89
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F7740F89
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFu5YI9m
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 00F7740F89
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 08:59:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78630601D3;
	Wed, 13 Aug 2025 08:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701F8C4CEEB;
	Wed, 13 Aug 2025 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755075575;
	bh=XmgEE2r9/03Htllgcwpg18c5MfZ8FEI0JOAF6sFxxKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFu5YI9mwImluA2LuTvGgHPMWyR/bSWgPuEhbfBznuDalHg4kTg+x0roHajv5AHg4
	 D32HX/mrgpBryIOnX5aP/C+ChyZzzknuJrJlFWqhgFfUcmFpjHw1N3ZZ1UobJXGNMD
	 YpoxbqZ7vcYXwjGi2VlcV0eQqgN3pnMMgGgrkUL3tcY0ImqL5zpQ7w6XAz6wY6wGcJ
	 SF1yCyB4cBg3HrLdQLnlxB1yfLiiXg/rCEHS3z1YtA7YEWMeww9xARP4xkq1U/rb6q
	 lI4HTQdA6ERBEayxeYrD6XYWW19PCgC78Jkw1bxmtmxRib7oXl/5hasQVnsnTfJsZP
	 yD3XvXnlc8tsg==
Message-ID: <066729ba-bd9a-4328-a813-9ef73620020c@kernel.org>
Date: Wed, 13 Aug 2025 17:59:31 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
To: Erick Karanja <karanja99erick@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Christoph Hellwig <hch@lst.de>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250813071837.668613-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/25 16:18, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
> 
> Reported-by: codespell
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
