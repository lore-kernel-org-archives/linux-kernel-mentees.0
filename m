Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A041C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Aug 2022 16:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54E941768;
	Sat,  6 Aug 2022 16:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D54E941768
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qEXwC38K
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 637YMFdoZdCj; Sat,  6 Aug 2022 16:35:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4C1F341703;
	Sat,  6 Aug 2022 16:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1F341703
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18590C0033;
	Sat,  6 Aug 2022 16:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B372C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 16:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3087A41703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 16:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3087A41703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9XqRcKWr9Ms
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 16:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6BC7416FC
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6BC7416FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 16:35:45 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l64so5151461pge.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Aug 2022 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0MU4Yqf6GJfvNh1a7lGlSBJCwiX3GsCyGqFjRLdNTE=;
 b=qEXwC38Kxjlp61BqU5cdP6Pp94sySiOvCrkPvWDGwED4MKUr/r8eZfE1VPVsGou9cE
 +hhULhAP4akru4Ht0XEeVgu4h5afOsATovYrArheWBS90ICePr/EpgeZHSgyDqJPPJLq
 W63bvL+5jgTg1wDxxI1cBYGn/TAwC7jgJLFbffRsm08xqC6KWNdTJIsg14x6qzmpSFV4
 M4SSvb/d+FDxrmStTS9aKjL7aVYJ2uHsQc3p9E/GGnOFODnmILW/v82ZOT4lNa4JKJ+q
 ynVl4eXQWzVOK8o66mryswb+G8mazYbO/bKMCqyXoU6YJ6ZoENMFGkEC9k1yqAviAogx
 icZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0MU4Yqf6GJfvNh1a7lGlSBJCwiX3GsCyGqFjRLdNTE=;
 b=7OYSaUOyaMgOMkm2fRm5SYs5mXoNE11dYAC+2FKpmPwoIpaeOHClHNBmRJrVyylfWm
 V0RXnfUkJb16hI13/1N6CbM5DEAZzPmh6T1uZDPgNorSrIAy6zexHzbs2mVjVd/NCkPs
 wSrwPyBK2UC9dhie9O9o4h0GD2mOAE6rsCW8DlW3fGtCZL4ydF3TlvkQ+uTeQRuKBDtY
 VG9fcRxz9PU+Tkq0FbpSPWS/OWDAWAG/Um4j9ZmYHGK9t/QBV4hu++LdxMA0sxoSOmbH
 F3ZOyu6QM2XiU3iN/iat7EX49Ap2fbeQAfVMETKiEXwDKx0+wUWIrUonOKTXt4xuu6c+
 ihdw==
X-Gm-Message-State: ACgBeo3nW716H25Olvxusjn+xKT986500KREWuMUrsz8rRiMXXAdFKo3
 u9RCzsxXZn20F8ELfZ5czWk=
X-Google-Smtp-Source: AA6agR7QhxIrA6dpIBNy6uyYbIDiyydJWjQv0EjduWoduOD7tMAIJKmBDxq4VdlpyqyguThMc1y3dw==
X-Received: by 2002:a63:69c7:0:b0:41c:590a:62dc with SMTP id
 e190-20020a6369c7000000b0041c590a62dcmr9387979pgc.388.1659803744962; 
 Sat, 06 Aug 2022 09:35:44 -0700 (PDT)
Received: from biggie.. ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 b7-20020a170902d50700b0016f057b88c9sm5283301plg.26.2022.08.06.09.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 09:35:44 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Subject: [PATCH v3] selftests/net: Refactor xfrm_fill_key() to use array of
 structs
Date: Sat,  6 Aug 2022 22:05:30 +0530
Message-Id: <20220806163530.70182-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <55c8de7e-a6e8-fc79-794d-53536ad7a65d@collabora.com>
References: <55c8de7e-a6e8-fc79-794d-53536ad7a65d@collabora.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>
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

A TODO in net/ipsec.c asks to refactor the code in xfrm_fill_key() to
use set/map to avoid manually comparing each algorithm with the "name" 
parameter passed to the function as an argument. This patch refactors 
the code to create an array of structs where each struct contains the 
algorithm name and its corresponding key length.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
changes in v3:
1. Initialize the struct array of algorithms->keys at compile time

changes in v2:
1. Fix the compilation warnings for struct and variable declaration

 tools/testing/selftests/net/ipsec.c | 104 ++++++++++++----------------
 1 file changed, 45 insertions(+), 59 deletions(-)

diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index cc10c10c5ed9..9a8229abfa02 100644
--- a/tools/testing/selftests/net/ipsec.c
+++ b/tools/testing/selftests/net/ipsec.c
@@ -58,6 +58,8 @@
 #define VETH_FMT	"ktst-%d"
 #define VETH_LEN	12
 
+#define XFRM_ALGO_NR_KEYS 29
+
 static int nsfd_parent	= -1;
 static int nsfd_childa	= -1;
 static int nsfd_childb	= -1;
@@ -75,6 +77,43 @@ const unsigned int ping_timeout		= 300;
 const unsigned int ping_count		= 100;
 const unsigned int ping_success		= 80;
 
+struct xfrm_key_entry {
+	char algo_name[35];
+	int key_len;
+};
+
+struct xfrm_key_entry xfrm_key_entries[] = {
+	{"digest_null", 0},
+	{"ecb(cipher_null)", 0},
+	{"cbc(des)", 64},
+	{"hmac(md5)", 128},
+	{"cmac(aes)", 128},
+	{"xcbc(aes)", 128},
+	{"cbc(cast5)", 128},
+	{"cbc(serpent)", 128},
+	{"hmac(sha1)", 160},
+	{"hmac(rmd160)", 160},
+	{"cbc(des3_ede)", 192},
+	{"hmac(sha256)", 256},
+	{"cbc(aes)", 256},
+	{"cbc(camellia)", 256},
+	{"cbc(twofish)", 256},
+	{"rfc3686(ctr(aes))", 288},
+	{"hmac(sha384)", 384},
+	{"cbc(blowfish)", 448},
+	{"hmac(sha512)", 512},
+	{"rfc4106(gcm(aes))-128", 160},
+	{"rfc4543(gcm(aes))-128", 160},
+	{"rfc4309(ccm(aes))-128", 152},
+	{"rfc4106(gcm(aes))-192", 224},
+	{"rfc4543(gcm(aes))-192", 224},
+	{"rfc4309(ccm(aes))-192", 216},
+	{"rfc4106(gcm(aes))-256", 288},
+	{"rfc4543(gcm(aes))-256", 288},
+	{"rfc4309(ccm(aes))-256", 280},
+	{"rfc7539(chacha20,poly1305)-128", 0}
+};
+
 static void randomize_buffer(void *buf, size_t buflen)
 {
 	int *p = (int *)buf;
@@ -767,65 +806,12 @@ static int do_ping(int cmd_fd, char *buf, size_t buf_len, struct in_addr from,
 static int xfrm_fill_key(char *name, char *buf,
 		size_t buf_len, unsigned int *key_len)
 {
-	/* TODO: use set/map instead */
-	if (strncmp(name, "digest_null", ALGO_LEN) == 0)
-		*key_len = 0;
-	else if (strncmp(name, "ecb(cipher_null)", ALGO_LEN) == 0)
-		*key_len = 0;
-	else if (strncmp(name, "cbc(des)", ALGO_LEN) == 0)
-		*key_len = 64;
-	else if (strncmp(name, "hmac(md5)", ALGO_LEN) == 0)
-		*key_len = 128;
-	else if (strncmp(name, "cmac(aes)", ALGO_LEN) == 0)
-		*key_len = 128;
-	else if (strncmp(name, "xcbc(aes)", ALGO_LEN) == 0)
-		*key_len = 128;
-	else if (strncmp(name, "cbc(cast5)", ALGO_LEN) == 0)
-		*key_len = 128;
-	else if (strncmp(name, "cbc(serpent)", ALGO_LEN) == 0)
-		*key_len = 128;
-	else if (strncmp(name, "hmac(sha1)", ALGO_LEN) == 0)
-		*key_len = 160;
-	else if (strncmp(name, "hmac(rmd160)", ALGO_LEN) == 0)
-		*key_len = 160;
-	else if (strncmp(name, "cbc(des3_ede)", ALGO_LEN) == 0)
-		*key_len = 192;
-	else if (strncmp(name, "hmac(sha256)", ALGO_LEN) == 0)
-		*key_len = 256;
-	else if (strncmp(name, "cbc(aes)", ALGO_LEN) == 0)
-		*key_len = 256;
-	else if (strncmp(name, "cbc(camellia)", ALGO_LEN) == 0)
-		*key_len = 256;
-	else if (strncmp(name, "cbc(twofish)", ALGO_LEN) == 0)
-		*key_len = 256;
-	else if (strncmp(name, "rfc3686(ctr(aes))", ALGO_LEN) == 0)
-		*key_len = 288;
-	else if (strncmp(name, "hmac(sha384)", ALGO_LEN) == 0)
-		*key_len = 384;
-	else if (strncmp(name, "cbc(blowfish)", ALGO_LEN) == 0)
-		*key_len = 448;
-	else if (strncmp(name, "hmac(sha512)", ALGO_LEN) == 0)
-		*key_len = 512;
-	else if (strncmp(name, "rfc4106(gcm(aes))-128", ALGO_LEN) == 0)
-		*key_len = 160;
-	else if (strncmp(name, "rfc4543(gcm(aes))-128", ALGO_LEN) == 0)
-		*key_len = 160;
-	else if (strncmp(name, "rfc4309(ccm(aes))-128", ALGO_LEN) == 0)
-		*key_len = 152;
-	else if (strncmp(name, "rfc4106(gcm(aes))-192", ALGO_LEN) == 0)
-		*key_len = 224;
-	else if (strncmp(name, "rfc4543(gcm(aes))-192", ALGO_LEN) == 0)
-		*key_len = 224;
-	else if (strncmp(name, "rfc4309(ccm(aes))-192", ALGO_LEN) == 0)
-		*key_len = 216;
-	else if (strncmp(name, "rfc4106(gcm(aes))-256", ALGO_LEN) == 0)
-		*key_len = 288;
-	else if (strncmp(name, "rfc4543(gcm(aes))-256", ALGO_LEN) == 0)
-		*key_len = 288;
-	else if (strncmp(name, "rfc4309(ccm(aes))-256", ALGO_LEN) == 0)
-		*key_len = 280;
-	else if (strncmp(name, "rfc7539(chacha20,poly1305)-128", ALGO_LEN) == 0)
-		*key_len = 0;
+	int i;
+
+	for (i = 0; i < XFRM_ALGO_NR_KEYS; i++) {
+		if (strncmp(name, xfrm_key_entries[i].algo_name, ALGO_LEN) == 0)
+			*key_len = xfrm_key_entries[i].key_len;
+	}
 
 	if (*key_len > buf_len) {
 		printk("Can't pack a key - too big for buffer");
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
