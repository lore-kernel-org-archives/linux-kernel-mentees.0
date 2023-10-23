Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75BAC00A8F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 14:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22764420A0;
	Mon, 23 Oct 2023 14:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22764420A0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXqtsBl0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHCKr3YJDMvb; Mon, 23 Oct 2023 14:19:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3E34209D;
	Mon, 23 Oct 2023 14:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3E34209D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAAF0C0071;
	Mon, 23 Oct 2023 14:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 002ACC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DB7403EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DB7403EA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=SXqtsBl0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0sBq0cJvgYv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86BA140141
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 14:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86BA140141
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6D9D3CE2464;
 Mon, 23 Oct 2023 14:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AD9C433C7;
 Mon, 23 Oct 2023 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698070738;
 bh=XKHA+o3oAqp09heCyRAIPWkyf94HR5PsGQ+iB2G7+R4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=SXqtsBl0acWkhV/sCPXQG+Utt7JaB3KYlIbEyxJC+W54DIqmBKHov+jQIjMU/UItE
 010fYFXToKgIPVNKJXUv2n0OEiBkHvLzMYGp23QH/MVdRaGyJOHDX4dCYJkwDJRF9t
 1O307y6lQQE+RArvnyI0aLLf7tGu5L4bA04vkiwnYAZamzJE9AeTiN45mexw0eavih
 PhUGyPbtMth/t6p6eLmDjDdvFaBPEIJZLOkIBYI4KKoDqV8QjGDWscPiEcDHqsOzF2
 H/UnTpi8unNmg2OUn0Vm3JIXIi+I9Zj/5ij+WrBli8OwrfGwACHmg/hpr4o4BZURKr
 T+05CXxngK04g==
Message-ID: <df63abf1-90cc-4f94-90e4-0ffb44c914f2@kernel.org>
Date: Mon, 23 Oct 2023 08:18:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests:net change ifconfig with ip command
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 davem@davemloft.net, jiri@resnulli.us, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <ZTYc04N9VK7EarHY@nanopsycho>
 <20231023123422.2895-1-swarupkotikalapudi@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231023123422.2895-1-swarupkotikalapudi@gmail.com>
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

On 10/23/23 6:34 AM, Swarup Laxman Kotiaklapudi wrote:
> Change ifconfig with ip command,
> on a system where ifconfig is
> not used this script will not
> work correcly.
> 
> Test result with this patchset:
> 
> sudo make TARGETS="net" kselftest
> ....
> TAP version 13
> 1..1
>  timeout set to 1500
>  selftests: net: route_localnet.sh
>  run arp_announce test
>  net.ipv4.conf.veth0.route_localnet = 1
>  net.ipv4.conf.veth1.route_localnet = 1
>  net.ipv4.conf.veth0.arp_announce = 2
>  net.ipv4.conf.veth1.arp_announce = 2
>  PING 127.25.3.14 (127.25.3.14) from 127.25.3.4 veth0: 56(84)
>   bytes of data.
>  64 bytes from 127.25.3.14: icmp_seq=1 ttl=64 time=0.038 ms
>  64 bytes from 127.25.3.14: icmp_seq=2 ttl=64 time=0.068 ms
>  64 bytes from 127.25.3.14: icmp_seq=3 ttl=64 time=0.068 ms
>  64 bytes from 127.25.3.14: icmp_seq=4 ttl=64 time=0.068 ms
>  64 bytes from 127.25.3.14: icmp_seq=5 ttl=64 time=0.068 ms
> 
>  --- 127.25.3.14 ping statistics ---
>  5 packets transmitted, 5 received, 0% packet loss, time 4073ms
>  rtt min/avg/max/mdev = 0.038/0.062/0.068/0.012 ms
>  ok
>  run arp_ignore test
>  net.ipv4.conf.veth0.route_localnet = 1
>  net.ipv4.conf.veth1.route_localnet = 1
>  net.ipv4.conf.veth0.arp_ignore = 3
>  net.ipv4.conf.veth1.arp_ignore = 3
>  PING 127.25.3.14 (127.25.3.14) from 127.25.3.4 veth0: 56(84)
>   bytes of data.
>  64 bytes from 127.25.3.14: icmp_seq=1 ttl=64 time=0.032 ms
>  64 bytes from 127.25.3.14: icmp_seq=2 ttl=64 time=0.065 ms
>  64 bytes from 127.25.3.14: icmp_seq=3 ttl=64 time=0.066 ms
>  64 bytes from 127.25.3.14: icmp_seq=4 ttl=64 time=0.065 ms
>  64 bytes from 127.25.3.14: icmp_seq=5 ttl=64 time=0.065 ms
> 
>  --- 127.25.3.14 ping statistics ---
>  5 packets transmitted, 5 received, 0% packet loss, time 4092ms
>  rtt min/avg/max/mdev = 0.032/0.058/0.066/0.013 ms
>  ok
> ok 1 selftests: net: route_localnet.sh
> ...
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  tools/testing/selftests/net/route_localnet.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/route_localnet.sh b/tools/testing/selftests/net/route_localnet.sh
> index 116bfeab72fa..e08701c750e3 100755
> --- a/tools/testing/selftests/net/route_localnet.sh
> +++ b/tools/testing/selftests/net/route_localnet.sh
> @@ -18,8 +18,10 @@ setup() {
>      ip route del 127.0.0.0/8 dev lo table local
>      ip netns exec "${PEER_NS}" ip route del 127.0.0.0/8 dev lo table local
>  
> -    ifconfig veth0 127.25.3.4/24 up
> -    ip netns exec "${PEER_NS}" ifconfig veth1 127.25.3.14/24 up
> +    ip address add 127.25.3.4/24 dev veth0
> +    ip link set dev veth0 up
> +    ip netns exec "${PEER_NS}" ip address add 127.25.3.14/24 dev veth1
> +    ip netns exec "${PEER_NS}" ip link set dev veth1 up
>  
>      ip route flush cache
>      ip netns exec "${PEER_NS}" ip route flush cache

Reviewed-by: David Ahern <dsahern@kernel.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
