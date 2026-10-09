Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163A28315D
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  9 Oct 2026 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563200; cv=none; b=JJZxI2q7ELmpvs/MRn+YskpiOG42Ebclg6rl9r6mGMidC8bqn09rZfdktZh1OhtiAeeLBf7lDzWwXkZ73vmyRJ6sbS3gNpgCaFGrVzMxEXjU0dEQ6nxOIaQfTfD5E+ZT9jcNmNN6LGHAxefN7ayStOuwE8x5NIRXC2jFF9mIW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563200; c=relaxed/simple;
	bh=z8LVxDwXNisEDg9XRjD9l5cNR4q4YDySjviXXc/lnQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ot2K4Cyw/BubrKfP8IwWZmpWluH6XiBh/F3AEfrZx9wXhCT8oMEVR8VCsx+yDgHXTVA3ORCHz5nSxrxemKfjHliWUwGXecHGphIzsXp5ktBZdgrIqr7pamXCl4x3q+cQU47fCQalpp+jpPRXZmfO4I2HNywVQQiKEr7kK98BNtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzMRbVgo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzMRbVgo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-487048857f6so3902876f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 09 Oct 2026 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791563189; x=1792167989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ckizy139Yx68MapGfbyuMco76+jqL/TiZ1vLBTM9150=;
        b=BzMRbVgo15NPN7uLkLYK6sVaq12arqgkj9rdpigVwaVZyUau1pxE0w3I0RjfCjwRG2
         u8EKtVGwW4RKY4wHuDYicem38dQWtsSV06sA+sOSbMxXOlVIb20YFC/fZXt52I3cpsHt
         9kK4ijJdGC/PsTGdjtUjVLv0oIyTmX0IintoXORsuC889Ye8Ur06h5MJ3vx892zZfSXH
         x2HkpsLAlT3tJrGdLvmSL/sXr5xIAzALXppPjQIakYRW4F/RJPB+iqGDMKpY0hiViFIN
         PmMa9karQiM6frnS+doF+4WsRlO4QQiZV/K7qnkspQQ2Q+Wb0GlppFwjUBqbypk1AO74
         MJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563189; x=1792167989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ckizy139Yx68MapGfbyuMco76+jqL/TiZ1vLBTM9150=;
        b=k0XtDyjalpW9F9QAPU15oB/hSU22btyFtAwtKdg6/6Zp6uiHHZn2eke3hCrL5Pe3Dy
         202b3VLhVM1BfNpgnMXQXN1YKOE27J8csFjTBzx3/D5ZAAw2B4FMOVWoEAsfFI/2LzNV
         ntHcodkk/vew6STOpKGnkoCcVvS0gS8ZeE87sCZYVrCQAoA5+/3uOmYVEJ39PsovLE51
         +2xjVaMLUaPl3R0o75RT+9ogkvNLDIrsOE2CAg7SZlduNHvtQ7ku/F2kCBVnaMQ4tGyn
         OHz6VNyafuPL1VAwW/vZ9+ElBFYqXjO/z4JvAskwtHSuLL1pA3UVSZw88/Zv9+dGw3Pi
         cluw==
X-Forwarded-Encrypted: i=1; AKwUvBwYbn0CyYLrAPD/l+pbAAE7dxRO2bQMkV15dxawbIvMUF8oAh5UgfAcLo2noffv39iCTIeerNLzQUo9pxL1U/MkBnNaKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJKmPaVA1oJF3ykRUtt6u/AE8xE/byZH4mNIWcltaJ7zIisVdIK
	b4NVSO7hCMO3r6h86TGaEAPshFsBTPzcF3lGLIQcqKbrUvxJD7GJyl8s
X-Gm-Gg: AYBFou2J60Ig5ZfLdu9Pu8kjTJcyqKA+mbFmR+epCS3xdR0dletRi6YwgEI8EQxzrhy
	bstZnCAazn7eWxUDshEnYEqK70ZqAv0zkrZXMPHc4FOj8xwKIzLJAB12b/YlZjvyOX+nRrR3s6S
	aNEpYvw+lXrw1E6525lg2MTGqgszTYCKlpx4LGSWs2PEbP1wCEpEzUKUeMJa32AYsqLHYESBh81
	vlXa3rZqqMyp3ojxpTPJMYHNDDcS2n2DQtIk0s01/TPTVQnokh+M262hhYcfCIgJO75AFI/nPeC
	X5HAWzzvJhIcE9ot9mp3GWEFNnnqRxJqbUMNE/J57utRt906CgcwPAnoXK7uYnGqC7ncTezzrux
	HfotUCvae9cZV+VLxFSXEXJDWmdlwoRN6l1PFciH2rRe3rzHrMlOv5onkD4fShb2rD4/BwAF/qv
	Rh9LB5fI3niTd0hVM/dcoyHbRZInOaP8DkHnPeYP9UsBnxW5Em496hTFvg9rVAU5TmDTsWHEJ0Q
	CZFNpfdbUOM9HGEUMfgKtPXcAoBsm0h+ZVVx1E3SIIr6ownwYtGJmt2xdhZr5IG9n0=
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3251605f8f.28.1791563188334;
        Fri, 09 Oct 2026 09:26:28 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm4745750f8f.35.2026.10.09.09.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:26:27 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com
Subject: [PATCH nf v2] netfilter: synproxy: check TCP header before verifying checksum
Date: Fri,  9 Oct 2026 17:26:24 +0100
Message-Id: <20261009162624.16294-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synproxy_tg6() calls nf_ip6_checksum() with par->thoff before it checks
that there is actually a TCP header at that offset.

par->thoff comes from ipv6_find_hdr(), which ip6_packet_match() calls
with target -1. ipv6_find_hdr() only makes sure the first two bytes of
each extension header are in the skb. It then adds the header's declared
length to the offset and stops at the first non-extension header, so the
offset it returns can be past the end of the packet. For a CHECKSUM_NONE
skb, nf_ip6_checksum() then calls skb_checksum(skb, 0, thoff, 0), and if
thoff is bigger than skb->len we hit the BUG_ON(len) in skb_checksum():

  kernel BUG at net/core/skbuff.c:3606!
  RIP: 0010:skb_checksum+0x8b2/0x8c0
  Call Trace:
   nf_ip6_checksum+0x1bd/0x320 net/netfilter/utils.c:89
   synproxy_tg6+0x1a4/0x6e0 net/ipv6/netfilter/ip6t_SYNPROXY.c:21
   ip6t_do_table+0xd37/0x15b0 net/ipv6/netfilter/ip6_tables.c:366
   ...

syzbot's reproducer sends a 60-byte packet with an AH header followed by
two hop-by-hop headers. The second hop-by-hop header says the next header
is TCP and has hdrlen 167, which gives a thoff of 1400.

nft_synproxy_do_eval() has the same ordering: it calls nf_checksum()
before it fetches the TCP header.

In both places, get the TCP header with skb_header_pointer() first and
only then verify the checksum, the same way nf_reject_ip6_tcphdr_get()
does it. Packets that don't have a full TCP header at thoff are now
dropped before we try to checksum them.

Fixes: 4ad362282cb4 ("netfilter: add IPv6 SYNPROXY target")
Fixes: a311a8981727 ("netfilter: nft_synproxy: use the family-aware checksum helper")
Reported-by: syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5a8667f002726fc59f88
Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
Thanks Fernando for the review, and for spotting the nft_synproxy case
and giving me the chance to fix it in this patch as well.

v2:
- Also fix nft_synproxy_do_eval() and add its Fixes: tag, as Fernando
  suggested
- Drop the comment in synproxy_tg6()
- Add Fernando's Reviewed-by
- Rebase on v7.3-rc7

Testing: I ran syzbot's reproducer on v7.3-rc7 with this patch applied
and ee319bd3a0e9 ("ipv6: do not let ipv6_find_hdr() return an offset
past the packet end") reverted, since that commit already stops the bad
offset from reaching the target on current trees. The BUG doesn't fire
any more. The nft_synproxy change is only build-tested so far; I haven't
managed to get a packet through an nft synproxy rule with the bad offset
yet.

v1: https://lore.kernel.org/all/20260926204519.43402-1-raghunathpalla.0209@gmail.com/

 net/ipv6/netfilter/ip6t_SYNPROXY.c |  6 +++---
 net/netfilter/nft_synproxy.c       | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/netfilter/ip6t_SYNPROXY.c b/net/ipv6/netfilter/ip6t_SYNPROXY.c
index d51d0c3e5fe9..b3aa4fe67589 100644
--- a/net/ipv6/netfilter/ip6t_SYNPROXY.c
+++ b/net/ipv6/netfilter/ip6t_SYNPROXY.c
@@ -18,13 +18,13 @@ synproxy_tg6(struct sk_buff *skb, const struct xt_action_param *par)
 	struct synproxy_options opts = {};
 	struct tcphdr *th, _th;
 
-	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
-		return NF_DROP;
-
 	th = skb_header_pointer(skb, par->thoff, sizeof(_th), &_th);
 	if (th == NULL)
 		return NF_DROP;
 
+	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
+		return NF_DROP;
+
 	if (!synproxy_parse_options(skb, par->thoff, th, &opts))
 		return NF_DROP;
 
diff --git a/net/netfilter/nft_synproxy.c b/net/netfilter/nft_synproxy.c
index 554a96a000f4..6b290a89886d 100644
--- a/net/netfilter/nft_synproxy.c
+++ b/net/netfilter/nft_synproxy.c
@@ -118,12 +118,6 @@ static void nft_synproxy_do_eval(const struct nft_synproxy *priv,
 		return;
 	}
 
-	if (nf_checksum(skb, nft_hook(pkt), thoff, IPPROTO_TCP,
-			nft_pf(pkt))) {
-		regs->verdict.code = NF_DROP;
-		return;
-	}
-
 	tcp = skb_header_pointer(skb, thoff,
 				 sizeof(struct tcphdr),
 				 &_tcph);
@@ -132,6 +126,12 @@ static void nft_synproxy_do_eval(const struct nft_synproxy *priv,
 		return;
 	}
 
+	if (nf_checksum(skb, nft_hook(pkt), thoff, IPPROTO_TCP,
+			nft_pf(pkt))) {
+		regs->verdict.code = NF_DROP;
+		return;
+	}
+
 	if (!synproxy_parse_options(skb, thoff, tcp, &opts)) {
 		regs->verdict.code = NF_DROP;
 		return;
-- 
2.34.1

