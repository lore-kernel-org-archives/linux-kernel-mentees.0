Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DD12C7FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314098; cv=none; b=UltI96sHQF0/GUuNKyXJyQjGwsa9d39EJG7Bd/fBI3CVv7dsDaURIotqW/uXfqBL0sjChu1LcnooqrBqHTB7NBjodTQwsXwrP8iRV2AOnhszwM7v7FAU0fDxiaCcx2bYj+ezef4tPeAN2+0v5ky9nspgZC5II1thKmKijbRov30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314098; c=relaxed/simple;
	bh=6p8gncaaZsHPc5k3Qs2ZLsncfJuQGvSixclKj5eyQLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enyuzigo5nRhvlnhsjdvs91SnZ8QMs4ZoOTzkm4waBrrtkCVQhF4Dp86GCdcWwqaK+f+zIIk9KHzaM8uV1qtpdT4TKMkczPgT1My3tMp/a1WDnGYv3N8WieGlHLwe4jPzJc0hhu90xuD0dofUpMMgiCCV8ZQOWF9hBXq+4zd4ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmhN37MG; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmhN37MG"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22BAC40207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwow-MgwWuCu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Mar 2025 05:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FC0E401D2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FC0E401D2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RmhN37MG
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0FC0E401D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:54:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac41514a734so577500566b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Mar 2025 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743314094; x=1743918894; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZS5hChiziL0zECiXtf+2ICQEzuKraJOFVrf1WXGBpo=;
        b=RmhN37MGTiurLjll1lTHvOSMMy2FNo4mrXLUtOXUvM8TYAWPZsmwOTHaXZovnJqtgA
         +bjCSwNMPlmSgshhm4uOvlOLlX0qU6AYNHgTZOMlo0CkY4CkGdM0kmEBtqxWuhOWvhA2
         ltouFHgzThRa+W0kKvR/pqoR3PdUDkNazFj+7rb9rJEgj0YZ3TeIdNSQyUc6maO17b0I
         D6Uj/vNSwl2kGFjhBknlzLkO8dU3z5WdycuFUqrmTdgx8zyz7ltNKMoDDHXRKmvtNZU+
         eQ/fv/RjkLEjHacXnoc+n6KxofwfnARmSQ52WEv+gll9moKD6BEUE4xQrHLHiWVNxop/
         Nb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743314094; x=1743918894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZS5hChiziL0zECiXtf+2ICQEzuKraJOFVrf1WXGBpo=;
        b=iIx4xR0un+e6D4F7pEgyt4XXPouOFuhy8tafy54lcqxkT+qng8e1JWzWMqPjiyy7xn
         FgbcqwNv8Vq3LIBI5DT0ktkVYJqAnzrx3IjhJ0qVbSWyQhmY8Bo5gyhTIx3W5DC49zgX
         5AGnTYa7EljlLj87ubgC8shR65yD3h595+NqVIJ2oBroz/WFjjYBunlnpYXbeob0EJkw
         rQrVmHDQD54LxacpBVjI9eCNNEph8sfudJp16rfHRwGMTxY6Gc9Bq+HS/GCkPXJRfAQs
         Z0/SgbZon7IMWghm7/FavJiM1aCn9LutQs+h3DhixIix4tX2shtfe4ENM12nCeWxXZtY
         8oVA==
X-Forwarded-Encrypted: i=1; AJvYcCV9VJ1cRDk7WdVI0s8gf/suoXcbYfsqst2hu+h4+rPrU7zFVNyTPka8bKXohSwPSvjFlJxmdRMQv+ccBjpWW1ugrdc6rA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyj7CBuu1NTwtXIaChKeLQVJSJVxvLBonnfr8yxBsbNCR0H/6Fo
	SEvxAJoMVN1ktM2rpX/80+0MTGGX1rMMvj9NBixJ2MzXzPNRowo75yT/D2gYqRFHv1/W
X-Gm-Gg: ASbGncvyV5tBSW6ApL6rH++k+ymSh819Ur8d6xMwggBETpDuFfhY0in46pCFihrcLkk
	KgTK4ypf7drfxIy9MbZz5O3xSzPUc+TQW/zLTf5i2kNPPx62ngmxhpeIK8TcV+lJcOzOoBh8J3o
	j4+ka9hzijakBzj0hPhhP+VkQ/E812PyDpAljXlzonjhyZfBOrTJ2bc+hie0PSwSmPtoo7Ndozo
	Dwo9DIGYBxVagpafTwCyfafnOVDbL0eNk3kBbJCeO3wU0+o2/q2EN1wAe33Z1MtJ5cmiGyHxbzA
	cSa+HAm5Qc+PTYOaCsMokRmZD0wq0mEvYam6zJVk2bxiR/f62OWKeXPqRpw8ac6DtXU=
X-Google-Smtp-Source: AGHT+IE87WJv0/ZzDl3FXShm+jTRY2Te+7Zv9PYAX8DvccPdhOEnetOp/txCzMreLmUt78hsaQBNgA==
X-Received: by 2002:a17:907:7f07:b0:ac2:55f2:f939 with SMTP id a640c23a62f3a-ac738975e33mr385096066b.6.1743314093493;
        Sat, 29 Mar 2025 22:54:53 -0700 (PDT)
Received: from localhost (44.tor-exit.nothingtohide.nl. [192.42.116.218])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71922ba63sm433884266b.2.2025.03.29.22.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 22:54:53 -0700 (PDT)
Date: Sun, 30 Mar 2025 07:54:50 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] ACPI: mark ACPI_COPY_NAMESEG destinations with
 __nonstring attribute
Message-ID: <a9bd2a1b490b4305c18f8473aab21c97e8902fb8.1743313252.git.x0rw3ll@gmail.com>
References: <cover.1743313252.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1743313252.git.x0rw3ll@gmail.com>

strncpy(), which ACPI_COPY_NAMESEG currently uses, is deprecated[1].

This patch is the first of two, ultimately replacing strncpy() with
strtomem(), avoiding future compiler warnings about truncation.

[1] https://github.com/KSPP/linux/issues/90

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
 drivers/acpi/acpica/acdebug.h                            | 2 +-
 drivers/acpi/prmt.c                                      | 2 +-
 drivers/acpi/sysfs.c                                     | 4 ++--
 include/acpi/actbl.h                                     | 6 +++---
 tools/power/acpi/os_specific/service_layers/oslinuxtbl.c | 2 +-
 tools/power/acpi/tools/acpidump/apfiles.c                | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/acpica/acdebug.h b/drivers/acpi/acpica/acdebug.h
index 911875c5a5f1..2b56a8178f43 100644
--- a/drivers/acpi/acpica/acdebug.h
+++ b/drivers/acpi/acpica/acdebug.h
@@ -37,7 +37,7 @@ struct acpi_db_argument_info {
 struct acpi_db_execute_walk {
 	u32 count;
 	u32 max_count;
-	char name_seg[ACPI_NAMESEG_SIZE + 1];
+	char name_seg[ACPI_NAMESEG_SIZE + 1] __nonstring;
 };
 
 #define PARAM_LIST(pl)                  pl
diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
index e549914a636c..ca70f01c940c 100644
--- a/drivers/acpi/prmt.c
+++ b/drivers/acpi/prmt.c
@@ -40,7 +40,7 @@ struct prm_buffer {
 };
 
 struct prm_context_buffer {
-	char signature[ACPI_NAMESEG_SIZE];
+	char signature[ACPI_NAMESEG_SIZE] __nonstring;
 	u16 revision;
 	u16 reserved;
 	guid_t identifier;
diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index a48ebbf768f9..a05d4032d4f1 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -307,9 +307,9 @@ static struct kobject *hotplug_kobj;
 
 struct acpi_table_attr {
 	struct bin_attribute attr;
-	char name[ACPI_NAMESEG_SIZE];
+	char name[ACPI_NAMESEG_SIZE] __nonstring;
 	int instance;
-	char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE];
+	char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE] __nonstring;
 	struct list_head node;
 };
 
diff --git a/include/acpi/actbl.h b/include/acpi/actbl.h
index 451f6276da49..8aa60281e7db 100644
--- a/include/acpi/actbl.h
+++ b/include/acpi/actbl.h
@@ -66,12 +66,12 @@
  ******************************************************************************/
 
 struct acpi_table_header {
-	char signature[ACPI_NAMESEG_SIZE];	/* ASCII table signature */
+	char signature[ACPI_NAMESEG_SIZE] __nonstring;	/* ASCII table signature */
 	u32 length;		/* Length of table in bytes, including this header */
 	u8 revision;		/* ACPI Specification minor version number */
 	u8 checksum;		/* To make sum of entire table == 0 */
-	char oem_id[ACPI_OEM_ID_SIZE];	/* ASCII OEM identification */
-	char oem_table_id[ACPI_OEM_TABLE_ID_SIZE];	/* ASCII OEM table identification */
+	char oem_id[ACPI_OEM_ID_SIZE] __nonstring;	/* ASCII OEM identification */
+	char oem_table_id[ACPI_OEM_TABLE_ID_SIZE] __nonstring;	/* ASCII OEM table identification */
 	u32 oem_revision;	/* OEM revision number */
 	char asl_compiler_id[ACPI_NAMESEG_SIZE];	/* ASCII ASL compiler vendor ID */
 	u32 asl_compiler_revision;	/* ASL compiler version */
diff --git a/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c b/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
index 9d70d8c945af..52026b9e389e 100644
--- a/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
+++ b/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
@@ -19,7 +19,7 @@ ACPI_MODULE_NAME("oslinuxtbl")
 typedef struct osl_table_info {
 	struct osl_table_info *next;
 	u32 instance;
-	char signature[ACPI_NAMESEG_SIZE];
+	char signature[ACPI_NAMESEG_SIZE] __nonstring;
 
 } osl_table_info;
 
diff --git a/tools/power/acpi/tools/acpidump/apfiles.c b/tools/power/acpi/tools/acpidump/apfiles.c
index 13817f9112c0..5a39b7d9351d 100644
--- a/tools/power/acpi/tools/acpidump/apfiles.c
+++ b/tools/power/acpi/tools/acpidump/apfiles.c
@@ -103,7 +103,7 @@ int ap_open_output_file(char *pathname)
 
 int ap_write_to_binary_file(struct acpi_table_header *table, u32 instance)
 {
-	char filename[ACPI_NAMESEG_SIZE + 16];
+	char filename[ACPI_NAMESEG_SIZE + 16] __nonstring;
 	char instance_str[16];
 	ACPI_FILE file;
 	acpi_size actual;
-- 
2.47.2

