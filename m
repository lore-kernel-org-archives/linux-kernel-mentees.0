Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15361C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 03:00:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D577A206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 03:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClJLtk7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D577A206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0700585C00;
	Mon,  3 Aug 2020 03:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIRK22sJ5LSe; Mon,  3 Aug 2020 03:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2E3B85BC2;
	Mon,  3 Aug 2020 03:00:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6938C0051;
	Mon,  3 Aug 2020 03:00:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16074C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 03:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F282B87BC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 03:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0sKfhQjViNB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 03:00:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F19587BC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 03:00:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ep8so1307493pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Aug 2020 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SslfOAYowcSIRE7OJfXaZEhy+2zzQJIxjTX2JOfNhb0=;
 b=ClJLtk7ld1m3Hbn7U3wLFVfTa9n9Sax2PhdyVglv8jYvKM1jE1XyUVKtIP5hZAiAJz
 K/WRlfx6ylvKa9drNpdWB6gfkpcLcro9XFpZAVrBeC7JxLRVfEFk90mvXFQEpuBAn6vr
 qyrFFAK3OPDJEs08ooJmUD8S7KnBgJtgf+slm10wKQBh0jXGtEv4c+Fv35Efh94ldzkC
 XqC60Gu4mO4M8kx8XMKsdf3fuacFkrAL2CG0nnwQZUrJqmlJqa/FMFeGyj8Nk6uP9PC5
 kVFov0WtpT6PGCn5Vy0s3oJ7W50SK4EDuToJrC41Hqa/qar9YLKecqt7zqZjLgyW5f7e
 Svzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SslfOAYowcSIRE7OJfXaZEhy+2zzQJIxjTX2JOfNhb0=;
 b=BJ+QufOb51RKTxEZhx8/B5VmMUGv2eqKXiEwUo/e/dhHpOI5tQw0TqgICu/AjkrbWj
 hAxG6ENba8pQOvggYw5PfzsGpkYjEEa//AuiEe4YvsvC6TweAEFrPnll3K04ET/Zod/N
 UNcN93W+RvIZ8xUpgs/qhQZkvklypRtdvQWgJzCU4OHKFTCf5VIf5CDl7jrRv7D1qVR/
 SzxIM56vdBfMr9QeSTDtl2LPnpQ1plHAexjtc2Ys3OXeMfbudXP6T8h0EFlBAjbWUPwg
 V0d81cZZvqDunfDn7gpPtNC75wA6/Iwel9Nt/iRTy8u9rRxc8FRUjUxypFZL7SJic0gO
 uD3A==
X-Gm-Message-State: AOAM530qmfWmXGymKWLfMMldF36zHR4NMucqalxwalqePNgPkt7mCA5i
 oINU3PZbclbV3zKgMV12h5w=
X-Google-Smtp-Source: ABdhPJxDrt2rUig4JsB3VONcCUv3daYW3E9vL8dO56SldvOAR9QRN2kiyiXC5AXgs1t7O5oC7rUAXQ==
X-Received: by 2002:a17:902:aa82:: with SMTP id
 d2mr12475796plr.336.1596423633945; 
 Sun, 02 Aug 2020 20:00:33 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([49.206.12.123])
 by smtp.gmail.com with ESMTPSA id g23sm18069768pfo.95.2020.08.02.20.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 20:00:33 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Date: Mon,  3 Aug 2020 08:29:39 +0530
Message-Id: <20200803025939.21106-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_uuid.c to KUnit
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

Converts test lib/test_uuid.c to KUnit.
More information about KUnit can be found at
https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
This change is beneficial as KUnit provides a common framework for
unit tests in the kernel. KUnit is fast as well.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
Changes v1->v2:
- Add a more detailed commit message

 lib/Kconfig.debug                 |  7 +--
 lib/Makefile                      |  2 +-
 lib/{test_uuid.c => uuid_kunit.c} | 84 +++++++++----------------------
 3 files changed, 28 insertions(+), 65 deletions(-)
 rename lib/{test_uuid.c => uuid_kunit.c} (48%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f174f8887ae7..330c0d1de50b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2070,9 +2070,6 @@ config TEST_BITFIELD
 
 	  If unsure, say N.
 
-config TEST_UUID
-	tristate "Test functions located in the uuid module at runtime"
-
 config TEST_XARRAY
 	tristate "Test the XArray code at runtime"
 
@@ -2273,6 +2270,10 @@ config BITS_TEST
 
 	  If unsure, say N.
 
+config UUID_KUNIT_TEST
+	tristate "KUnit test for functions located in the uuid module at runtime"
+	depends on KUNIT
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index 032cc6c71a3a..62ef383c7563 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -81,7 +81,6 @@ obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
 obj-$(CONFIG_TEST_STRSCPY) += test_strscpy.o
 obj-$(CONFIG_TEST_BITFIELD) += test_bitfield.o
-obj-$(CONFIG_TEST_UUID) += test_uuid.o
 obj-$(CONFIG_TEST_XARRAY) += test_xarray.o
 obj-$(CONFIG_TEST_PARMAN) += test_parman.o
 obj-$(CONFIG_TEST_KMOD) += test_kmod.o
@@ -342,5 +341,6 @@ obj-$(CONFIG_PLDMFW) += pldmfw/
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
+obj-$(CONFIG_UUID_KUNIT_TEST) += uuid_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
diff --git a/lib/test_uuid.c b/lib/uuid_kunit.c
similarity index 48%
rename from lib/test_uuid.c
rename to lib/uuid_kunit.c
index cd819c397dc7..f7f219ddecc2 100644
--- a/lib/test_uuid.c
+++ b/lib/uuid_kunit.c
@@ -3,6 +3,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <kunit/test.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -39,95 +40,56 @@ static const char * const test_uuid_wrong_data[] = {
 	"0cb4ddff-a545-4401-9d06-688af53e",	/* not enough data */
 };
 
-static unsigned total_tests __initdata;
-static unsigned failed_tests __initdata;
-
-static void __init test_uuid_failed(const char *prefix, bool wrong, bool be,
-				    const char *data, const char *actual)
-{
-	pr_err("%s test #%u %s %s data: '%s'\n",
-	       prefix,
-	       total_tests,
-	       wrong ? "passed on wrong" : "failed on",
-	       be ? "BE" : "LE",
-	       data);
-	if (actual && *actual)
-		pr_err("%s test #%u actual data: '%s'\n",
-		       prefix,
-		       total_tests,
-		       actual);
-	failed_tests++;
-}
-
-static void __init test_uuid_test(const struct test_uuid_data *data)
+static void test_uuid_test(struct kunit *test, const struct test_uuid_data *data)
 {
 	guid_t le;
 	uuid_t be;
 	char buf[48];
 
 	/* LE */
-	total_tests++;
-	if (guid_parse(data->uuid, &le))
-		test_uuid_failed("conversion", false, false, data->uuid, NULL);
-
-	total_tests++;
-	if (!guid_equal(&data->le, &le)) {
-		sprintf(buf, "%pUl", &le);
-		test_uuid_failed("cmp", false, false, data->uuid, buf);
-	}
+	KUNIT_EXPECT_EQ(test, 0, guid_parse(data->uuid, &le));
+	KUNIT_EXPECT_TRUE(test, guid_equal(&data->le, &le));
 
 	/* BE */
-	total_tests++;
-	if (uuid_parse(data->uuid, &be))
-		test_uuid_failed("conversion", false, true, data->uuid, NULL);
-
-	total_tests++;
-	if (!uuid_equal(&data->be, &be)) {
-		sprintf(buf, "%pUb", &be);
-		test_uuid_failed("cmp", false, true, data->uuid, buf);
-	}
+	KUNIT_EXPECT_EQ(test, 0, uuid_parse(data->uuid, &be));
+	KUNIT_EXPECT_TRUE(test, uuid_equal(&data->be, &be));
 }
 
-static void __init test_uuid_wrong(const char *data)
+static void test_uuid_wrong(struct kunit *test, const char *data)
 {
 	guid_t le;
 	uuid_t be;
 
 	/* LE */
-	total_tests++;
-	if (!guid_parse(data, &le))
-		test_uuid_failed("negative", true, false, data, NULL);
+	KUNIT_EXPECT_NE(test, 0, guid_parse(data, &le));
 
 	/* BE */
-	total_tests++;
-	if (!uuid_parse(data, &be))
-		test_uuid_failed("negative", true, true, data, NULL);
+	KUNIT_EXPECT_NE(test, 0, uuid_parse(data, &be));
 }
 
-static int __init test_uuid_init(void)
+static void test_uuid_init(struct kunit *test)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(test_uuid_test_data); i++)
-		test_uuid_test(&test_uuid_test_data[i]);
+		test_uuid_test(test, &test_uuid_test_data[i]);
 
 	for (i = 0; i < ARRAY_SIZE(test_uuid_wrong_data); i++)
-		test_uuid_wrong(test_uuid_wrong_data[i]);
+		test_uuid_wrong(test, test_uuid_wrong_data[i]);
+}
 
-	if (failed_tests == 0)
-		pr_info("all %u tests passed\n", total_tests);
-	else
-		pr_err("failed %u out of %u tests\n", failed_tests, total_tests);
+static struct kunit_case uuid_test_cases[] = {
+	KUNIT_CASE(test_uuid_init),
+	{}
+};
 
-	return failed_tests ? -EINVAL : 0;
-}
-module_init(test_uuid_init);
+static struct kunit_suite uuid_test_suite = {
+	.name = "uuid-kunit-test",
+	.test_cases = uuid_test_cases,
+};
+
+kunit_test_suite(uuid_test_suite);
 
-static void __exit test_uuid_exit(void)
-{
-	/* do nothing */
-}
-module_exit(test_uuid_exit);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
