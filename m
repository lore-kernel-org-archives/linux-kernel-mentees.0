Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A5AC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 03:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2868C410A0;
	Wed,  3 Aug 2022 03:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2868C410A0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CHPXie25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iXfWU_3Bq6W; Wed,  3 Aug 2022 03:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9664440925;
	Wed,  3 Aug 2022 03:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9664440925
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72EFEC0032;
	Wed,  3 Aug 2022 03:23:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63DDBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E2D14092A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E2D14092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCkBUQnGauYR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:23:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF981408E7
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF981408E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:23:39 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id q19so5983720pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 02 Aug 2022 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQ/MHL3AvHE6awMttMKHegw9J9rY4eAGNJ5s9dewrd8=;
 b=CHPXie25jR2yWr9q5odc83pPNnA80K0CM8v9EuqtArCTlfixskGUqP5vwCjZClW/QS
 GfR6JSopZS+FH/bzKW/g2bL5z0clGf/22+e0F9Z2eQIb74nGjanx4AKahht+Ouu0OBs8
 dEpg+ur6KU8Zv4ZEbgF5JBzpT5hQSWG5GI4aNsCzR3R3D8As8ne+iLXa7mFAWZVgvsAJ
 wqfm3DWlOnODenQn0n0wb/6L3PtnZ3UlOwLj8XXo8VEpl4x1sG30qi+POOPaD63ADxlO
 pXzI5WrL1kXH41AkH6Hq+k2ych93SEJr9RlfaUy8OwlODbzsOImZKh415RlHhdYM0Fpi
 Yvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQ/MHL3AvHE6awMttMKHegw9J9rY4eAGNJ5s9dewrd8=;
 b=J4USNrh2+d8BeCurRxqk4WvhUK+gCz3I30Or2aAFIZHW+Q8cmEpEfMXZHQ+hkvUVkT
 MmgWwbasPqgfgCnDCprUiXCcs0AaAqGUowleG2bXGPK6ueaqYAGeEgC8D82511dQkQBa
 WFBf5Jqj1Vl1ytsTl1fgeJzQkuBuNVvSlv0WeZLnpD0GBmhFTst4M50md21NwVCFSnWl
 Q/fpg7SUzhDKkdWoYduPYK0rlDfnDGoJe2e7+kqd/cuTuGsZTvDn5mX6gkIQB7sVHC0v
 n8C3/kbsqg78PNRjmDlm3j1yJxw9LTIFBxsXl4OdODwIhU6TNJmjCWH1pSkdWmRwctTc
 ex1w==
X-Gm-Message-State: AJIora/AXC4ID4YBpa4cbFGDrSFgXiYVNxjaHNlIB0hxhc34TtODdNSE
 rcNgXpdBAPgsP/GbBFZcjTs=
X-Google-Smtp-Source: AGRyM1sCSz0Ss42sowkoQjXeEl16MwPxdyBbyTUiA1CDxjKiO/EnKpC5aN4upe+iDII6riEw+RVOMw==
X-Received: by 2002:a63:f502:0:b0:415:ee58:b22b with SMTP id
 w2-20020a63f502000000b00415ee58b22bmr19076904pgh.349.1659497019088; 
 Tue, 02 Aug 2022 20:23:39 -0700 (PDT)
Received: from biggie.. ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 b9-20020a170902d50900b0016dbdf7b97bsm458620plg.266.2022.08.02.20.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 20:23:38 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Subject: [PATCH v2] selftests/net: Refactor xfrm_fill_key() to use array of
 structs
Date: Wed,  3 Aug 2022 08:53:12 +0530
Message-Id: <20220803032312.3939-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
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
changes in v2:
1. Fix the compilation warnings for struct and variable declaration

 tools/testing/selftests/net/ipsec.c | 108 +++++++++++++---------------
 1 file changed, 49 insertions(+), 59 deletions(-)

diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index cc10c10c5ed9..4a0eeb5b71d2 100644
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
@@ -75,6 +77,46 @@ const unsigned int ping_timeout		= 300;
 const unsigned int ping_count		= 100;
 const unsigned int ping_success		= 80;
 
+struct xfrm_key_entry {
+	char algo_name[35];
+	int key_len;
+};
+
+struct xfrm_key_entry xfrm_key_entries[XFRM_ALGO_NR_KEYS];
+
+static void init_xfrm_algo_keys(void)
+{
+	xfrm_key_entries[0] = (struct xfrm_key_entry) {"digest_null", 0};
+	xfrm_key_entries[1] = (struct xfrm_key_entry) {"ecb(cipher_null)", 0};
+	xfrm_key_entries[2] = (struct xfrm_key_entry) {"cbc(des)", 64};
+	xfrm_key_entries[3] = (struct xfrm_key_entry) {"hmac(md5)", 128};
+	xfrm_key_entries[4] = (struct xfrm_key_entry) {"cmac(aes)", 128};
+	xfrm_key_entries[5] = (struct xfrm_key_entry) {"xcbc(aes)", 128};
+	xfrm_key_entries[6] = (struct xfrm_key_entry) {"cbc(cast5)", 128};
+	xfrm_key_entries[7] = (struct xfrm_key_entry) {"cbc(serpent)", 128};
+	xfrm_key_entries[8] = (struct xfrm_key_entry) {"hmac(sha1)", 160};
+	xfrm_key_entries[9] = (struct xfrm_key_entry) {"hmac(rmd160)", 160};
+	xfrm_key_entries[10] = (struct xfrm_key_entry) {"cbc(des3_ede)", 192};
+	xfrm_key_entries[11] = (struct xfrm_key_entry) {"hmac(sha256)", 256};
+	xfrm_key_entries[12] = (struct xfrm_key_entry) {"cbc(aes)", 256};
+	xfrm_key_entries[13] = (struct xfrm_key_entry) {"cbc(camellia)", 256};
+	xfrm_key_entries[14] = (struct xfrm_key_entry) {"cbc(twofish)", 256};
+	xfrm_key_entries[15] = (struct xfrm_key_entry) {"rfc3686(ctr(aes))", 288};
+	xfrm_key_entries[16] = (struct xfrm_key_entry) {"hmac(sha384)", 384};
+	xfrm_key_entries[17] = (struct xfrm_key_entry) {"cbc(blowfish)", 448};
+	xfrm_key_entries[18] = (struct xfrm_key_entry) {"hmac(sha512)", 512};
+	xfrm_key_entries[19] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-128", 160};
+	xfrm_key_entries[20] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-128", 160};
+	xfrm_key_entries[21] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-128", 152};
+	xfrm_key_entries[22] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-192", 224};
+	xfrm_key_entries[23] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-192", 224};
+	xfrm_key_entries[24] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-192", 216};
+	xfrm_key_entries[25] = (struct xfrm_key_entry) {"rfc4106(gcm(aes))-256", 288};
+	xfrm_key_entries[26] = (struct xfrm_key_entry) {"rfc4543(gcm(aes))-256", 288};
+	xfrm_key_entries[27] = (struct xfrm_key_entry) {"rfc4309(ccm(aes))-256", 280};
+	xfrm_key_entries[28] = (struct xfrm_key_entry) {"rfc7539(chacha20,poly1305)-128", 0};
+}
+
 static void randomize_buffer(void *buf, size_t buflen)
 {
 	int *p = (int *)buf;
@@ -767,65 +809,12 @@ static int do_ping(int cmd_fd, char *buf, size_t buf_len, struct in_addr from,
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
@@ -2305,6 +2294,7 @@ int main(int argc, char **argv)
 		}
 	}
 
+	init_xfrm_algo_keys();
 	srand(time(NULL));
 	page_size = sysconf(_SC_PAGESIZE);
 	if (page_size < 1)
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
