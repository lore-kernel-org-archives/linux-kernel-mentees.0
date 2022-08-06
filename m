Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B19EC19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Aug 2022 15:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC26382D49;
	Sat,  6 Aug 2022 15:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC26382D49
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HDDak1UX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsYN0eE0HpBx; Sat,  6 Aug 2022 15:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 60D4082E14;
	Sat,  6 Aug 2022 15:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D4082E14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38246C0032;
	Sat,  6 Aug 2022 15:26:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F750C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 15:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3483F40352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 15:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3483F40352
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HDDak1UX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cq31e0P7Efc2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 15:26:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D56400DB
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00D56400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 15:26:49 +0000 (UTC)
Received: from [192.168.10.23] (unknown [39.46.64.186])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DBC66601B6F;
 Sat,  6 Aug 2022 16:26:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659799607;
 bh=HdwNEzS966/lk5zR+dVV1aaOS5MuoSUELdjHQTmX1ck=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HDDak1UXe3vv3h6kbHJQw7nwZjtGvmIT5Eswp61Mt56xLYkr35C+q+Rxh6u6G/emW
 M+MX2oNqsYx//x0KRiMj6Y5LMa9eWduO6ou/m2yP1QodLjmPMEedsmwlZxCIeidodn
 q8IC1H462Z/ZmRDBNSbwcpTV1D1+lNaao+Ffoqj/pPqOOF2HG0zJXAXYcCL6CMF5pG
 J/1ln4sQOyT1cAfYtvrG73OTbkjpmInT9pkughxsjq6wk4SQ2rR+dqmjSUJKl+cQHG
 Kbhkoo0M61HxjGHIKuV60hsv9Wmu7xVLA0B3LI2xVuZbETd7FhktzCbV5CtcBRTkUX
 E6ALLlo/Nz/wQ==
Message-ID: <55c8de7e-a6e8-fc79-794d-53536ad7a65d@collabora.com>
Date: Sat, 6 Aug 2022 20:26:38 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] selftests/net: Refactor xfrm_fill_key() to use array
 of structs
Content-Language: en-US
To: Gautam Menghani <gautammenghani201@gmail.com>,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org
References: <20220803032312.3939-1-gautammenghani201@gmail.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20220803032312.3939-1-gautammenghani201@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 usama.anjum@collabora.com
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

On 8/3/22 8:23 AM, Gautam Menghani wrote:
> A TODO in net/ipsec.c asks to refactor the code in xfrm_fill_key() to
> use set/map to avoid manually comparing each algorithm with the "name" 
> parameter passed to the function as an argument. This patch refactors 
> the code to create an array of structs where each struct contains the 
> algorithm name and its corresponding key length.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
> changes in v2:
> 1. Fix the compilation warnings for struct and variable declaration
> 
>  tools/testing/selftests/net/ipsec.c | 108 +++++++++++++---------------
>  1 file changed, 49 insertions(+), 59 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
> index cc10c10c5ed9..4a0eeb5b71d2 100644
> --- a/tools/testing/selftests/net/ipsec.c
> +++ b/tools/testing/selftests/net/ipsec.c
> @@ -58,6 +58,8 @@
>  #define VETH_FMT	"ktst-%d"
>  #define VETH_LEN	12
>  
> +#define XFRM_ALGO_NR_KEYS 29
> +
>  static int nsfd_parent	= -1;
>  static int nsfd_childa	= -1;
>  static int nsfd_childb	= -1;
> @@ -75,6 +77,46 @@ const unsigned int ping_timeout		= 300;
>  const unsigned int ping_count		= 100;
>  const unsigned int ping_success		= 80;
>  
> +struct xfrm_key_entry {
> +	char algo_name[35];
> +	int key_len;
> +};
> +
> +struct xfrm_key_entry xfrm_key_entries[XFRM_ALGO_NR_KEYS];
There seems no need to fill up xfrm_key_entries at run time. Please fill
them at compile time.

struct xfrm_key_entry xfrm_key_entries[] = {
	{"digest_null", 0},
	{"ecb(cipher_null)", 0},
	...
};

> +
> +static void init_xfrm_algo_keys(void)
> +{
> +	xfrm_key_entries[0] = (struct xfrm_key_entry) {"digest_null", 0};
> +	xfrm_key_entries[1] = (struct xfrm_key_entry) {"ecb(cipher_null)", 0};
> +	xfrm_key_entries[2] = (struct xfrm_key_entry) {"cbc(des)", 64};
> +	xfrm_key_entries[3] = (struct xfrm_key_entry) {"hmac(md5)", 128};
> +	xfrm_key_entries[4] = (struct xfrm_key_entry) {"cmac(aes)", 128};
> +	xfrm_key_entries[5] = (struct xfrm_key_entry) {"xcbc(aes)", 128};
> +	xfrm_key_entries[6] = (struct xfrm_key_entry) {"cbc(cast5)", 128};
> +	xfrm_key_entries[7] = (struct xfrm_key_entry) {"cbc(serpent)", 128};
> +	xfrm_key_entries[8] = (struct xfrm_key_entry) {"hmac(sha1)", 160};
> +	xfrm_key_entries[9] = (struct xfrm_key_entry) {"hmac(rmd160)", 160};
> +	xfrm_key_entries[10] = (struct xfrm_key_entry) {"cbc(des3_ede)", 192};
> +	xfrm_key_entries[11] = (struct xfrm_key_entry) {"hmac(sha256)", 256};
> +	xfrm_key_entries[12] = (struct xfrm_key_entry) {"cbc(aes)", 256};
> +	xfrm_key_entries[13] = (struct xfrm_key_entry) {"cbc(camellia)", 256};
> +	xfrm_key_entries[14] = (struct xfrm_key_entry) {"cbc(twofish)", 256};
> +	xfrm_key_entries[15] = (struct xfrm_key_entry) {"rfc3686(ctr(aes))", 288};
> +	xfrm_key_entries[16] = (struct xfrm_key_entry) {"hmac(sha384)", 384};
> +	xfrm_key_entries[17] = (struct xfrm_key_entry) {"cbc(blowfish)", 448};
> +	xfrm_key_entries[18] = (struct xfrm_key_entry) {"hmac(sha512)", 512};
> +	xfrm_key_entries[19] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-128", 160};
> +	xfrm_key_entries[20] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-128", 160};
> +	xfrm_key_entries[21] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-128", 152};
> +	xfrm_key_entries[22] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-192", 224};
> +	xfrm_key_entries[23] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-192", 224};
> +	xfrm_key_entries[24] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-192", 216};
> +	xfrm_key_entries[25] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-256", 288};
> +	xfrm_key_entries[26] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-256", 288};
> +	xfrm_key_entries[27] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-256", 280};
> +	xfrm_key_entries[28] = (struct xfrm_key_entry) {"rfc7539(chacha20,poly1305)-128", 0};
> +}

-- 
Muhammad Usama Anjum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
