Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAB6C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 19:59:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478BA233FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 19:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478BA233FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDA0B8740F;
	Thu, 17 Dec 2020 19:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zj98cOMHAG6c; Thu, 17 Dec 2020 19:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC73C87197;
	Thu, 17 Dec 2020 19:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8945AC088E;
	Thu, 17 Dec 2020 19:59:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3F4AC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C1B42D8B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEPRumIKQFT4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by silver.osuosl.org (Postfix) with ESMTPS id 3217C203F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:59:22 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id j13so8043pjz.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QJFehwm82a19JLhZg4m6jaPNy9DGvAdL6pRYVLW2xjs=;
 b=LBgtZAYdmGhUqEPWnG+U05WZSu+9EaIryoxsADPkvbbsRZbPd69wTxLzVmRwjfyG/B
 FHG40NofBgFJv+HvaFLLVb+g3hmmFweBasj+peRQublOL2c4Se32yc0rXmBjIjmCrJZn
 lwswQBYhZUMPQt8UcO3Pt6iCWhhdjQVcnZ/PUIFTszaat6BZvTi90XLMhWg/8omu3Jw8
 bNYJpMs1zfSZvbV21A0Hh/vR8GgzBZW6my9CmNRyeB3WtYqPJewvubqxzxu2g9t9SVoW
 yUR4fH4aOTmB3ILpBYCE6i59Gb06DYxAq9TpS5tj6En/dZNUwyXweBWT2gBGVSsW7L3E
 F/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QJFehwm82a19JLhZg4m6jaPNy9DGvAdL6pRYVLW2xjs=;
 b=rhdjiAeAzV4DXuOYb3wO8P2lviZJ9l3QMlrgoBpn08xJm5DHhmDgeZbTrNjahkwk37
 uS3fKCH+9EgCKy5N9RgN5uufO2bMP3af4J3kagCMZuhxl6fYUjz3uN2BO7tYvFbEtD2q
 NAWv75K8Eyv91cu+NKVHEMNsoO2eZqph5DAtoVTeniY9E71aUK41kRHWVC+ruapj3f3A
 47vjJsJ5ywB86UidyJhIeVxl1RtNYePFKNDxLv54z37z1n0CcWktsCgRyki85JKfh3zb
 d5UaUOz+YcZL2QYwrY+In6fS7sVi1zdOeYk4tAegRj7nM2I+R4hAWH184Cp/NyhzQ2os
 EXvA==
X-Gm-Message-State: AOAM532DAwV1yOhyXbVni/uSetaOc+iZLQUsJ9qEaf6HnNQCJKYdRjP9
 Art7i/EgzIxcnukPJt8uBrd0JezgqIcquPwx
X-Google-Smtp-Source: ABdhPJzBGnt9S32es7D5hblKrBAl+/SuHiMVd8b99MHdy2N+neosi19loDzWJsUDNnm6jCS47KuZiA==
X-Received: by 2002:a17:90b:11d7:: with SMTP id
 gv23mr849956pjb.2.1608235161495; 
 Thu, 17 Dec 2020 11:59:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6023:858f:fc0a:73ba:a8b4])
 by smtp.gmail.com with ESMTPSA id z15sm6309400pfn.34.2020.12.17.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 11:59:20 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 18 Dec 2020 01:29:02 +0530
Message-Id: <20201217195902.67041-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] scripts: mod: cleanup a few
	checkpatch.pl warnings
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

Cleanup some warnings reported by checkpatch.pl to make
the code more in line with the kernel coding style.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------------
 1 file changed, 83 insertions(+), 73 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index fb4827027536..4a87c5f42339 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -14,7 +14,8 @@
 #include "devicetable-offsets.h"
 
 /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
- * use either stdint.h or inttypes.h for the rest. */
+ * use either stdint.h or inttypes.h for the rest.
+ */
 #if KERNEL_ELFCLASS == ELFCLASS32
 typedef Elf32_Addr	kernel_ulong_t;
 #define BITS_PER_LONG 32
@@ -49,7 +50,8 @@ typedef struct {
 
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
- * we handle those differences explicitly below */
+ * we handle those differences explicitly below
+ */
 #include "../../include/linux/mod_devicetable.h"
 
 /* This array collects all instances that use the generic do_table */
@@ -84,16 +86,16 @@ struct devtable {
 
 #define ADD(str, sep, cond, field)                              \
 do {                                                            \
-        strcat(str, sep);                                       \
-        if (cond)                                               \
-                sprintf(str + strlen(str),                      \
-                        sizeof(field) == 1 ? "%02X" :           \
-                        sizeof(field) == 2 ? "%04X" :           \
-                        sizeof(field) == 4 ? "%08X" : "",       \
-                        field);                                 \
-        else                                                    \
-                sprintf(str + strlen(str), "*");                \
-} while(0)
+	strcat(str, sep);                                       \
+	if (cond)                                               \
+		sprintf(str + strlen(str),                      \
+			sizeof(field) == 1 ? "%02X" :           \
+			sizeof(field) == 2 ? "%04X" :           \
+			sizeof(field) == 4 ? "%08X" : "",       \
+			field);                                 \
+	else                                                    \
+		sprintf(str + strlen(str), "*");                \
+} while (0)
 
 /* End in a wildcard, for future extension */
 static inline void add_wildcard(char *str)
@@ -137,15 +139,15 @@ static void device_id_check(const char *modname, const char *device_id,
 		      modname, device_id, id_size, device_id, size, device_id);
 	}
 	/* Verify last one is a terminator */
-	for (i = 0; i < id_size; i++ ) {
-		if (*(uint8_t*)(symval+size-id_size+i)) {
-			fprintf(stderr,"%s: struct %s_device_id is %lu bytes.  "
+	for (i = 0; i < id_size; i++) {
+		if (*(uint8_t *)(symval + size - id_size + i)) {
+			fprintf(stderr, "%s: struct %s_device_id is %lu bytes.  "
 				"The last of %lu is:\n",
 				modname, device_id, id_size, size / id_size);
-			for (i = 0; i < id_size; i++ )
-				fprintf(stderr,"0x%02x ",
-					*(uint8_t*)(symval+size-id_size+i) );
-			fprintf(stderr,"\n");
+			for (i = 0; i < id_size; i++)
+				fprintf(stderr, "0x%02x ",
+					*(uint8_t *)(symval + size - id_size + i));
+			fprintf(stderr, "\n");
 			fatal("%s: struct %s_device_id is not terminated "
 				"with a NULL entry!\n", modname, device_id);
 		}
@@ -160,6 +162,7 @@ static void do_usb_entry(void *symval,
 			 unsigned char max, struct module *mod)
 {
 	char alias[500];
+
 	DEF_FIELD(symval, usb_device_id, match_flags);
 	DEF_FIELD(symval, usb_device_id, idVendor);
 	DEF_FIELD(symval, usb_device_id, idProduct);
@@ -173,24 +176,24 @@ static void do_usb_entry(void *symval,
 	DEF_FIELD(symval, usb_device_id, bInterfaceNumber);
 
 	strcpy(alias, "usb:");
-	ADD(alias, "v", match_flags&USB_DEVICE_ID_MATCH_VENDOR,
+	ADD(alias, "v", match_flags & USB_DEVICE_ID_MATCH_VENDOR,
 	    idVendor);
-	ADD(alias, "p", match_flags&USB_DEVICE_ID_MATCH_PRODUCT,
+	ADD(alias, "p", match_flags & USB_DEVICE_ID_MATCH_PRODUCT,
 	    idProduct);
 
 	strcat(alias, "d");
 	if (bcdDevice_initial_digits)
 		sprintf(alias + strlen(alias), "%0*X",
 			bcdDevice_initial_digits, bcdDevice_initial);
-	if (range_lo == range_hi)
+	if (range_lo == range_hi) {
 		sprintf(alias + strlen(alias), "%X", range_lo);
-	else if (range_lo > 0 || range_hi < max) {
-		if (range_lo > 0x9 || range_hi < 0xA)
+	} else if (range_lo > 0 || range_hi < max) {
+		if (range_lo > 0x9 || range_hi < 0xA) {
 			sprintf(alias + strlen(alias),
 				"[%X-%X]",
 				range_lo,
 				range_hi);
-		else {
+		} else {
 			sprintf(alias + strlen(alias),
 				range_lo < 0x9 ? "[%X-9" : "[%X",
 				range_lo);
@@ -202,19 +205,19 @@ static void do_usb_entry(void *symval,
 	if (bcdDevice_initial_digits < (sizeof(bcdDevice_lo) * 2 - 1))
 		strcat(alias, "*");
 
-	ADD(alias, "dc", match_flags&USB_DEVICE_ID_MATCH_DEV_CLASS,
+	ADD(alias, "dc", match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS,
 	    bDeviceClass);
-	ADD(alias, "dsc", match_flags&USB_DEVICE_ID_MATCH_DEV_SUBCLASS,
+	ADD(alias, "dsc", match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS,
 	    bDeviceSubClass);
-	ADD(alias, "dp", match_flags&USB_DEVICE_ID_MATCH_DEV_PROTOCOL,
+	ADD(alias, "dp", match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL,
 	    bDeviceProtocol);
-	ADD(alias, "ic", match_flags&USB_DEVICE_ID_MATCH_INT_CLASS,
+	ADD(alias, "ic", match_flags & USB_DEVICE_ID_MATCH_INT_CLASS,
 	    bInterfaceClass);
-	ADD(alias, "isc", match_flags&USB_DEVICE_ID_MATCH_INT_SUBCLASS,
+	ADD(alias, "isc", match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS,
 	    bInterfaceSubClass);
-	ADD(alias, "ip", match_flags&USB_DEVICE_ID_MATCH_INT_PROTOCOL,
+	ADD(alias, "ip", match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL,
 	    bInterfaceProtocol);
-	ADD(alias, "in", match_flags&USB_DEVICE_ID_MATCH_INT_NUMBER,
+	ADD(alias, "in", match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER,
 	    bInterfaceNumber);
 
 	add_wildcard(alias);
@@ -239,10 +242,10 @@ static unsigned int incbcd(unsigned int *bcd,
 	}
 
 	/* Convert BCD to Decimal */
-	for (i=0 ; i < chars ; i++) {
+	for (i = 0 ; i < chars ; i++) {
 		c = (*bcd >> (i << 2)) & 0xf;
 		c = c > 9 ? 9 : c; /* force to bcd just in case */
-		for (j=0 ; j < i ; j++)
+		for (j = 0 ; j < i ; j++)
 			c = c * 10;
 		dec += c;
 	}
@@ -252,8 +255,8 @@ static unsigned int incbcd(unsigned int *bcd,
 	*bcd  = 0;
 
 	/* Convert back to BCD */
-	for (i=0 ; i < chars ; i++) {
-		for (c=1,j=0 ; j < i ; j++)
+	for (i = 0 ; i < chars ; i++) {
+		for (c = 1, j = 0 ; j < i ; j++)
 			c = c * 10;
 		c = (dec / c) % 10;
 		*bcd += c << (i << 2);
@@ -386,7 +389,7 @@ static void do_of_table(void *symval, unsigned long size,
 
 /* Looks like: hid:bNvNpN */
 static int do_hid_entry(const char *filename,
-			     void *symval, char *alias)
+			void *symval, char *alias)
 {
 	DEF_FIELD(symval, hid_device_id, bus);
 	DEF_FIELD(symval, hid_device_id, group);
@@ -454,9 +457,9 @@ static int do_pci_entry(const char *filename,
 	interface = class;
 	interface_mask = class_mask;
 
-	if ((baseclass_mask != 0 && baseclass_mask != 0xFF)
-	    || (subclass_mask != 0 && subclass_mask != 0xFF)
-	    || (interface_mask != 0 && interface_mask != 0xFF)) {
+	if ((baseclass_mask != 0 && baseclass_mask != 0xFF) ||
+	    (subclass_mask != 0 && subclass_mask != 0xFF) ||
+	    (interface_mask != 0 && interface_mask != 0xFF)) {
 		warn("Can't handle masks in %s:%04X\n",
 		     filename, class_mask);
 		return 0;
@@ -480,13 +483,13 @@ static int do_ccw_entry(const char *filename,
 	DEF_FIELD(symval, ccw_device_id, dev_model);
 
 	strcpy(alias, "ccw:");
-	ADD(alias, "t", match_flags&CCW_DEVICE_ID_MATCH_CU_TYPE,
+	ADD(alias, "t", match_flags & CCW_DEVICE_ID_MATCH_CU_TYPE,
 	    cu_type);
-	ADD(alias, "m", match_flags&CCW_DEVICE_ID_MATCH_CU_MODEL,
+	ADD(alias, "m", match_flags & CCW_DEVICE_ID_MATCH_CU_MODEL,
 	    cu_model);
-	ADD(alias, "dt", match_flags&CCW_DEVICE_ID_MATCH_DEVICE_TYPE,
+	ADD(alias, "dt", match_flags & CCW_DEVICE_ID_MATCH_DEVICE_TYPE,
 	    dev_type);
-	ADD(alias, "dm", match_flags&CCW_DEVICE_ID_MATCH_DEVICE_MODEL,
+	ADD(alias, "dm", match_flags & CCW_DEVICE_ID_MATCH_DEVICE_MODEL,
 	    dev_model);
 	add_wildcard(alias);
 	return 1;
@@ -539,22 +542,22 @@ static int do_serio_entry(const char *filename,
  *       as don't care byte.
  */
 static int do_acpi_entry(const char *filename,
-			void *symval, char *alias)
+			 void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, acpi_device_id, id);
 	DEF_FIELD_ADDR(symval, acpi_device_id, cls);
 	DEF_FIELD_ADDR(symval, acpi_device_id, cls_msk);
 
-	if (id && strlen((const char *)*id))
+	if (id && strlen((const char *)*id)) {
 		sprintf(alias, "acpi*:%s:*", *id);
-	else if (cls) {
+	} else if (cls) {
 		int i, byte_shift, cnt = 0;
 		unsigned int msk;
 
 		sprintf(&alias[cnt], "acpi*:");
 		cnt = 6;
 		for (i = 1; i <= 3; i++) {
-			byte_shift = 8 * (3-i);
+			byte_shift = 8 * (3 - i);
 			msk = (*cls_msk >> byte_shift) & 0xFF;
 			if (msk)
 				sprintf(&alias[cnt], "%02x",
@@ -573,13 +576,13 @@ static void do_pnp_device_entry(void *symval, unsigned long size,
 				struct module *mod)
 {
 	const unsigned long id_size = SIZE_pnp_device_id;
-	const unsigned int count = (size / id_size)-1;
+	const unsigned int count = (size / id_size) - 1;
 	unsigned int i;
 
 	device_id_check(mod->name, "pnp", size, id_size, symval);
 
 	for (i = 0; i < count; i++) {
-		DEF_FIELD_ADDR(symval + i*id_size, pnp_device_id, id);
+		DEF_FIELD_ADDR(symval + i * id_size, pnp_device_id, id);
 		char acpi_id[sizeof(*id)];
 		int j;
 
@@ -599,13 +602,14 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 				struct module *mod)
 {
 	const unsigned long id_size = SIZE_pnp_card_device_id;
-	const unsigned int count = (size / id_size)-1;
+	const unsigned int count = (size / id_size) - 1;
 	unsigned int i;
 
 	device_id_check(mod->name, "pnp", size, id_size, symval);
 
 	for (i = 0; i < count; i++) {
 		unsigned int j;
+
 		DEF_FIELD_ADDR(symval + i * id_size, pnp_card_device_id, devs);
 
 		for (j = 0; j < PNP_MAX_DEVICES; j++) {
@@ -659,6 +663,7 @@ static int do_pcmcia_entry(const char *filename,
 			   void *symval, char *alias)
 {
 	unsigned int i;
+
 	DEF_FIELD(symval, pcmcia_device_id, match_flags);
 	DEF_FIELD(symval, pcmcia_device_id, manf_id);
 	DEF_FIELD(symval, pcmcia_device_id, card_id);
@@ -667,9 +672,8 @@ static int do_pcmcia_entry(const char *filename,
 	DEF_FIELD(symval, pcmcia_device_id, device_no);
 	DEF_FIELD_ADDR(symval, pcmcia_device_id, prod_id_hash);
 
-	for (i=0; i<4; i++) {
+	for (i = 0; i < 4; i++)
 		(*prod_id_hash)[i] = TO_NATIVE((*prod_id_hash)[i]);
-	}
 
 	strcpy(alias, "pcmcia:");
 	ADD(alias, "m", match_flags & PCMCIA_DEV_ID_MATCH_MANF_ID,
@@ -692,18 +696,19 @@ static int do_pcmcia_entry(const char *filename,
 }
 
 static int do_vio_entry(const char *filename, void *symval,
-		char *alias)
+			char *alias)
 {
 	char *tmp;
+
 	DEF_FIELD_ADDR(symval, vio_device_id, type);
 	DEF_FIELD_ADDR(symval, vio_device_id, compat);
 
 	sprintf(alias, "vio:T%sS%s", (*type)[0] ? *type : "*",
-			(*compat)[0] ? *compat : "*");
+		(*compat)[0] ? *compat : "*");
 
 	/* Replace all whitespace with underscores */
 	for (tmp = alias; tmp && *tmp; tmp++)
-		if (isspace (*tmp))
+		if (isspace(*tmp))
 			*tmp = '_';
 
 	add_wildcard(alias);
@@ -720,7 +725,7 @@ static void do_input(char *alias,
 	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
 		arr[i] = TO_NATIVE(arr[i]);
 	for (i = min; i < max; i++)
-		if (arr[i / BITS_PER_LONG] & (1L << (i%BITS_PER_LONG)))
+		if (arr[i / BITS_PER_LONG] & (1L << (i % BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
 
@@ -783,7 +788,7 @@ static int do_input_entry(const char *filename, void *symval,
 }
 
 static int do_eisa_entry(const char *filename, void *symval,
-		char *alias)
+			 char *alias)
 {
 	DEF_FIELD_ADDR(symval, eisa_device_id, sig);
 	if (sig[0])
@@ -795,7 +800,7 @@ static int do_eisa_entry(const char *filename, void *symval,
 
 /* Looks like: parisc:tNhvNrevNsvN */
 static int do_parisc_entry(const char *filename, void *symval,
-		char *alias)
+			   char *alias)
 {
 	DEF_FIELD(symval, parisc_device_id, hw_type);
 	DEF_FIELD(symval, parisc_device_id, hversion);
@@ -814,7 +819,7 @@ static int do_parisc_entry(const char *filename, void *symval,
 
 /* Looks like: sdio:cNvNdN. */
 static int do_sdio_entry(const char *filename,
-			void *symval, char *alias)
+			 void *symval, char *alias)
 {
 	DEF_FIELD(symval, sdio_device_id, class);
 	DEF_FIELD(symval, sdio_device_id, vendor);
@@ -887,11 +892,12 @@ static int do_vmbus_entry(const char *filename, void *symval,
 			  char *alias)
 {
 	int i;
+
 	DEF_FIELD_ADDR(symval, hv_vmbus_device_id, guid);
 	char guid_name[(sizeof(*guid) + 1) * 2];
 
 	for (i = 0; i < (sizeof(*guid) * 2); i += 2)
-		sprintf(&guid_name[i], "%02x", TO_NATIVE((guid->b)[i/2]));
+		sprintf(&guid_name[i], "%02x", TO_NATIVE((guid->b)[i / 2]));
 
 	strcpy(alias, "vmbus:");
 	strcat(alias, guid_name);
@@ -978,11 +984,11 @@ static void dmi_ascii_filter(char *d, const char *s)
 	*d = 0;
 }
 
-
 static int do_dmi_entry(const char *filename, void *symval,
 			char *alias)
 {
 	int i, j;
+
 	DEF_FIELD_ADDR(symval, dmi_system_id, matches);
 	sprintf(alias, "dmi*");
 
@@ -1015,15 +1021,16 @@ static int do_mdio_entry(const char *filename,
 			 void *symval, char *alias)
 {
 	int i;
+
 	DEF_FIELD(symval, mdio_device_id, phy_id);
 	DEF_FIELD(symval, mdio_device_id, phy_id_mask);
 
 	alias += sprintf(alias, MDIO_MODULE_PREFIX);
 
 	for (i = 0; i < 32; i++) {
-		if (!((phy_id_mask >> (31-i)) & 1))
+		if (!((phy_id_mask >> (31 - i)) & 1))
 			*(alias++) = '?';
-		else if ((phy_id >> (31-i)) & 1)
+		else if ((phy_id >> (31 - i)) & 1)
 			*(alias++) = '1';
 		else
 			*(alias++) = '0';
@@ -1128,6 +1135,7 @@ static int do_amba_entry(const char *filename,
 {
 	unsigned int digit;
 	char *p = alias;
+
 	DEF_FIELD(symval, amba_id, id);
 	DEF_FIELD(symval, amba_id, mask);
 
@@ -1342,18 +1350,19 @@ static int do_tee_entry(const char *filename, void *symval, char *alias)
 static int do_wmi_entry(const char *filename, void *symval, char *alias)
 {
 	int len;
+
 	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
 
 	if (strlen(*guid_string) != UUID_STRING_LEN) {
 		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
-				*guid_string, filename);
+		     *guid_string, filename);
 		return 0;
 	}
 
 	len = snprintf(alias, ALIAS_SIZE, WMI_MODULE_PREFIX "%s", *guid_string);
 	if (len < 0 || len >= ALIAS_SIZE) {
 		warn("Could not generate all MODULE_ALIAS's in '%s'\n",
-				filename);
+		     filename);
 		return 0;
 	}
 	return 1;
@@ -1376,7 +1385,7 @@ static int do_auxiliary_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Does namelen bytes of name exactly match the symbol? */
-static bool sym_is(const char *name, unsigned namelen, const char *symbol)
+static bool sym_is(const char *name, unsigned int namelen, const char *symbol)
 {
 	if (namelen != strlen(symbol))
 		return false;
@@ -1398,7 +1407,7 @@ static void do_table(void *symval, unsigned long size,
 	size -= id_size;
 
 	for (i = 0; i < size; i += id_size) {
-		if (do_entry(mod->name, symval+i, alias)) {
+		if (do_entry(mod->name, symval + i, alias)) {
 			buf_printf(&mod->dev_table_buf,
 				   "MODULE_ALIAS(\"%s\");\n", alias);
 		}
@@ -1454,7 +1463,8 @@ static const struct devtable devtable[] = {
 
 /* Create MODULE_ALIAS() statements.
  * At this time, we cannot write the actual output C source yet,
- * so we write into the mod->dev_table_buf buffer. */
+ * so we write into the mod->dev_table_buf buffer.
+ */
 void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname)
 {
@@ -1498,13 +1508,13 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	/* First handle the "special" cases */
 	if (sym_is(name, namelen, "usb"))
 		do_usb_table(symval, sym->st_size, mod);
-	if (sym_is(name, namelen, "of"))
+	if (sym_is(name, namelen, "of")) {
 		do_of_table(symval, sym->st_size, mod);
-	else if (sym_is(name, namelen, "pnp"))
+	} else if (sym_is(name, namelen, "pnp")) {
 		do_pnp_device_entry(symval, sym->st_size, mod);
-	else if (sym_is(name, namelen, "pnp_card"))
+	} else if (sym_is(name, namelen, "pnp_card")) {
 		do_pnp_card_entries(symval, sym->st_size, mod);
-	else {
+	} else {
 		int i;
 
 		for (i = 0; i < ARRAY_SIZE(devtable); i++) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
