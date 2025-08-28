Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED530F816
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387508; cv=none; b=r+wPrmPkUUPUbFDRdTHy47afIM638Wd8bW4A2awjloHamdw0mPniXJEcrDCIJzlIVVvuV5fQoINjtmUzQrr+1x2CC1cbZHE+sQbO8YMfVf1wjJKiP4Xti3Js/6cLJPndxPwaAVRqzdZ5lUxZ/LW/KpWurBix2fsec5WfOVT7XBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387508; c=relaxed/simple;
	bh=3+fLjvJ6M2nfneyCRPu7oLxAUIvhdsxi9nJsUcgZlL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKdvK+gUtErHnknqAkIHF2Up5ize2jrYb9jlJ4pt+LH+3LEL3r0caCKp2NCIOa0rofjYpXQrBCdNJJXJt2ZQd3BycmbSwQhi9WfALTPRz7cFQfM8UpkcNeCz8N9fR9OBJHXaL3MBUByUTAmRw/VA3dQbzui5dVWwA3aF8M/Mm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p4x69p4L; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p4x69p4L"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF66740E2D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 13:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rP9R0BC8x904 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Aug 2025 13:25:05 +0000 (UTC)
X-Greylist: delayed 361 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 28 Aug 2025 13:25:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A95840E40
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linux.dev
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A95840E40
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p4x69p4L
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=vadim.fedorenko@linux.dev; receiver=<UNKNOWN> 
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [IPv6:2001:41d0:203:375::b2])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3A95840E40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 13:25:03 +0000 (UTC)
Message-ID: <29cbde11-b7bc-4eba-a0ea-b20e4a9ecb79@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756387126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ry9En1+c5A+U28mpyuIa4te1ntjO/Ol6s1tDM1CUBU=;
	b=p4x69p4L4rEm652q4nL6TBN+nI7ENQuX3ucJYGokT1ZfNGL3WYg1pluOS5LMmx9hgcNFCT
	c+/Hi2rvg/r5wtKbbV0LOn1OhHMj/rRxYnp72V7OR5AawUjTPLOG2XDaFUkFCRcUCw8mEk
	JmYk7oY+tcoJ1bAFqnbVlc6SCqxpZIY=
Date: Thu, 28 Aug 2025 14:18:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] net: igb: expose rx_dropped via ethtool -S
To: Ranganath V N <vnranganath.20@gmail.com>, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, anthony.l.nguyen@intel.com,
 intel-wired-lan@lists.osuosl.org, edumazet@google.com
References: <20250828114209.12020-1-vnranganath.20@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250828114209.12020-1-vnranganath.20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 28/08/2025 12:42, Ranganath V N wrote:
> Currently the igb driver does not reports RX dropped
> packets in the ethtool -S statistics output, even though
> this information is already available in struct
> rtnl_link_stats64.
> 
> This patch adds rx_dropped, so users can monitor dropped
> packet counts directly with ethtool.
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
>   drivers/net/ethernet/intel/igb/igb_ethtool.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
> index 92ef33459aec..3c6289e80ba0 100644
> --- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
> +++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
> @@ -81,6 +81,7 @@ static const struct igb_stats igb_gstrings_stats[] = {
>   }
>   static const struct igb_stats igb_gstrings_net_stats[] = {
>   	IGB_NETDEV_STAT(rx_errors),
> +	IGB_NETDEV_STAT(rx_dropped),
>   	IGB_NETDEV_STAT(tx_errors),
>   	IGB_NETDEV_STAT(tx_dropped),
>   	IGB_NETDEV_STAT(rx_length_errors),

This stat is never used in the igb driver, what's the benefit of
constant 0 value in the output?
