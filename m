Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5C3EA7E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3aG6dWL"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E670981871
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 21:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E670981871
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c3aG6dWL
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8fg3vO05rGw
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 21:16:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4810981819
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 21:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4810981819
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D84AF6142C;
	Mon, 27 Nov 2023 21:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51051C433C7;
	Mon, 27 Nov 2023 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701119802;
	bh=c6Z70IQzlAjwbN76roiqBRgjUGnHmvbpyHemDhpH6Ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c3aG6dWLlm22sHtC7ql6y2DgXqfJ4ZzFdu0wVKjdpd0QSMpFS7KvDQfrMWEfk0gJK
	 iykKuI07pjJbd3w6DvOljKw1fiB/1PzbGmtEUXUy16nhltgmbMv2ascycBMDXX1hcp
	 cCmO4r3s1elNyC8SBf7gzqKNfVZqf8R+A9REtIEp5JsDfPhMe5qHRnqgXN0ruZgDjk
	 n10hpocdc6VnvMqXq5vU719WFEfH6JTTjWwMVN4WG4zEexlp+ZRnT9xB/82sqyw7rG
	 XK4oycPkYnxhIjeTjhjK++xaIALrKkRYHIln6U3eBJC1fibFP+vS/kEwdZKyNSimeQ
	 4TCQCHbscKbug==
Date: Mon, 27 Nov 2023 13:16:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 jiri@resnulli.us, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v4] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <20231127131641.320e2a27@kernel.org>
In-Reply-To: <20231126105246.195288-1-swarupkotikalapudi@gmail.com>
References: <20231126105246.195288-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Nov 2023 16:22:46 +0530 Swarup Laxman Kotiaklapudi wrote:
> diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
> index b3c8383d342d..ddb689dd3d7e 100644
> --- a/include/uapi/linux/devlink.h
> +++ b/include/uapi/linux/devlink.h
> @@ -248,7 +248,7 @@ enum devlink_param_reset_dev_on_drv_probe_value {
>  	DEVLINK_PARAM_RESET_DEV_ON_DRV_PROBE_VALUE_DISK,
>  };
>  
> -enum {
> +enum devlink_stats {
>  	DEVLINK_ATTR_STATS_RX_PACKETS,		/* u64 */
>  	DEVLINK_ATTR_STATS_RX_BYTES,		/* u64 */
>  	DEVLINK_ATTR_STATS_RX_DROPPED,		/* u64 */

This change unfortunately breaks the kernel build. There's already
a struct called devlink_stats. You can change that later but that'd 
be a separate patch, after the spec changes are accepted.

For now just keep these enums unnamed.

If the C codegen tries to use them as named (which I don't see it doing
now, FWIW) you can add an empty enum-name: attribute to the appropriate
enum definition in the spec, this will make the C code generator use a
bare "int" to store the values.
-- 
pw-bot: cr
