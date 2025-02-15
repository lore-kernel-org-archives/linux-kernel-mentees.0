Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4589E56C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 21:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739655940; cv=none; b=u8y1BurUsR2DSJofcp0EztjWeVlxZqnmU31e6QQqRmMqPQXH+CU6HnDSc0iCo0HOEAapXnnwAaYa/sY2yos/BMq7La/T+Tti3m46GIxcqeoYrEBKxfJ3TEW6JP2HpsFvRYzw52kO+fEfO9Ushc4ubI9VyhNI03jF7Z1WJJDMSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739655940; c=relaxed/simple;
	bh=JDi0g6omxQd+IKSkcA6lJe9mXVfeSl4N342oHTRkfPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq2otJm4wGE4FZjJftEoxJ075ig7Yc1SHqjfbA1Auh9IWu0LY6CQNojZmeat5JsA35DlWvtuAfAFSH81rAVqBp5uaHYV4F987ARVMcFP9gWBeysoDiUHODRCfhUqGviFz0WqGlNFtCJNScPGt51I4JDg0VL14pMDhPUBwedxiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Zc1gej31; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=jPDatS4A; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Zc1gej31";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="jPDatS4A"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA28831E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 21:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pxLKDxX1edi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2025 21:45:37 +0000 (UTC)
X-Greylist: delayed 555 seconds by postgrey-1.37 at util1.osuosl.org; Sat, 15 Feb 2025 21:45:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81C158200C
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=netfilter.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C158200C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=Zc1gej31;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=jPDatS4A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.190.124; helo=mail.netfilter.org; envelope-from=pablo@netfilter.org; receiver=<UNKNOWN> 
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81C158200C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 21:45:36 +0000 (UTC)
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 460FC602FB; Sat, 15 Feb 2025 22:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739655378;
	bh=IrOWNb052GzH1naxDxpdpOIqRG3ktl2xQkD48Z6xJ4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zc1gej31QLfGAa+/savVfMdcKI/NjhFTDjKLZ3ZxeowaC1IuKvmf/IehCHbaUujJ5
	 CMcCw56jENruI9UB9SJsFRosDhcEnnWUFn+uYLbZyfV5XfE43lCzLPjvCitAtBw59b
	 Mxffwb4NH2V+CmnCfqEpTPLrKAC0cg6rJasNR0jUdpwbWTPy2pwMG8DMN5+pUlff2t
	 AGUvXE+Vi4icJh77/zoHo5YAf4UvF1Lq2D+QYSWY8uQcDZrXSqH5JnMe0xCmigsEXT
	 ciO6QfytiTePDHp7dSJ0HZp29se6AvZ3XWgpxr8XFshV0xuNdYbf6VN+nD0Rgyi5Cd
	 mID5Fk6RLSQuQ==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 36FB0602C1;
	Sat, 15 Feb 2025 22:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739655377;
	bh=IrOWNb052GzH1naxDxpdpOIqRG3ktl2xQkD48Z6xJ4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPDatS4AHTupQiI76ipm/ryW3ULe1lu663zDIVKKWkURSNrRJfXjF0VUSWCr5jVDt
	 EPhP3QLKZjlpw3vxYnzebt+jvyIRCvwmaRBW+UQqkAWgmy8V7+QPbOiwKYzH2LHxXn
	 pw4Scu/QDjXNIcBvsWWmiNsdGP4Hi+zCGiAoraRiKUoy8RU2bIWisRj8X8BOq7njqX
	 4kZg6VJZuLytakAekHKn2sKkpJRnHOE++uqkny3bxNR6aKOIZrhykNkyeyz7nbYP6I
	 l1VZLj7FhuPzdiMmYOCr+9ZCWMsh11gSYlkzEz9tdudiGFRhOqNAgMIfc8FIWYSh6R
	 EOh754/r9GktQ==
Date: Sat, 15 Feb 2025 22:36:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kselftest@vger.kernel.org, ~lkcamp/patches@lists.sr.ht,
	netfilter-devel@vger.kernel.org
Subject: Re: [PATCH] selftests: netfilter: Fix typo in
 conntrack_icmp_related.sh comment
Message-ID: <Z7EIzrGhBKmJwK1H@calendula>
References: <20250215003802.1466786-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250215003802.1466786-1-marcelomoreira1905@gmail.com>

Cc'ing netfilter-devel.

On Fri, Feb 14, 2025 at 09:37:25PM -0300, Marcelo Moreira wrote:
> Correct the typo "adress" to "address" in a comment in conntrack_icmp_related.sh
> to improve clarity.
> 
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> index c63d840ead61..f63b7f12b36a 100755
> --- a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> +++ b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
> @@ -171,7 +171,7 @@ table inet filter {
>  }
>  EOF
>  
> -# make sure NAT core rewrites adress of icmp error if nat is used according to
> +# make sure NAT core rewrites address of icmp error if nat is used according to
>  # conntrack nat information (icmp error will be directed at nsrouter1 address,
>  # but it needs to be routed to nsclient1 address).
>  ip netns exec "$nsrouter1" nft -f - <<EOF
> -- 
> 2.48.1
> 
