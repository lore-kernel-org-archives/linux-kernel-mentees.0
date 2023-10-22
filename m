Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5E3CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Oct 2023 17:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB20840042;
	Sun, 22 Oct 2023 17:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB20840042
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uVZvQdXv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLTmvRq-cgmL; Sun, 22 Oct 2023 17:51:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8835940004;
	Sun, 22 Oct 2023 17:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8835940004
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61DA9C0071;
	Sun, 22 Oct 2023 17:51:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9ED5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8028C40012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 17:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8028C40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVMPHbOrh6Mt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 17:50:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66DC340004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 17:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66DC340004
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2EE4CCE12E4;
 Sun, 22 Oct 2023 17:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC802C433C7;
 Sun, 22 Oct 2023 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697997054;
 bh=a7bhSUEACARdlq+uMxJTYxwH4vFhfS8krMiwwfiEKSE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=uVZvQdXvjKYi6AzOm1BWXPZChWwTpjAO2Q98PUveYzLzJTehfW/4eSjrAY97EcIH8
 /rC4gT6u2sUK62SKS8PTy7TvYrQ+NReci0UwTlHQzNe5gir3J5WphZDYl5ICNvsYfg
 CvcxNV1xfZA1RG5OlbEGf9QxtaGB0s9jxqnYQgv/iiWge8em318oaRNncDK93jiORP
 kb7bYrbGJFbOljYZI2qm2ZaEY9S3a4pJ5PMD6MO99d7j0aWPghpOcsa1XyQ7H5jUql
 jyAby27BeHzkn9XRhfDNUvvwz/dQZYHJoUgOLmEhWZihxk8q5bcYcVY2Quc37ZpwNS
 ImoDGXT6vpHyw==
Message-ID: <fde654ce-e4b6-449c-94a9-eeaad1eed6b7@kernel.org>
Date: Sun, 22 Oct 2023 11:50:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:net change ifconfig with ip command
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/22/23 5:31 AM, Swarup Laxman Kotiaklapudi wrote:
> diff --git a/tools/testing/selftests/net/route_localnet.sh b/tools/testing/selftests/net/route_localnet.sh
> index 116bfeab72fa..3ab9beb4462c 100755
> --- a/tools/testing/selftests/net/route_localnet.sh
> +++ b/tools/testing/selftests/net/route_localnet.sh
> @@ -18,8 +18,10 @@ setup() {
>      ip route del 127.0.0.0/8 dev lo table local
>      ip netns exec "${PEER_NS}" ip route del 127.0.0.0/8 dev lo table local
>  
> -    ifconfig veth0 127.25.3.4/24 up
> -    ip netns exec "${PEER_NS}" ifconfig veth1 127.25.3.14/24 up
> +    ip a add 127.25.3.4/24 dev veth0

ip addr add ...

> +    ip link set dev veth0 up
> +    ip netns exec "${PEER_NS}" ip a add 127.25.3.14/24 dev veth1

ip addr add ...

> +    ip netns exec "${PEER_NS}" ip link set dev veth1 up
>  
>      ip route flush cache
>      ip netns exec "${PEER_NS}" ip route flush cache

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
