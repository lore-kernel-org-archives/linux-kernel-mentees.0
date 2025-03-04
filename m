Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0760C1F91FE
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075188; cv=none; b=fXyaDfJc9V90DjT80PXvzeHkEZkNAW9FICUHKsYLYCPTlTUIJXbVunmwJYagd2Rye28AkDZruk3ZotPHCgy3HoIwzGtoQWW3tjvK86aoHoA/6InRRaTbKidvENRyNGGIQkRTtgh1il8b4s/B9B+OM9E4k73ZFSjVWemJf+yNSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075188; c=relaxed/simple;
	bh=Cu4z4tJcKQnioK5oBCWV59p1bBfRBmR9sh8lkmQoAZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUXD0bUgAHKLqrFuL3bNAQRhDim0BisXWinHgAcAZdg9ok2ZtvfJUXIlT8hgL9W53ZJYDlCKeMBqmjORrkPn9q0ltfQ2THvSkzotuJQzPP8XAupaxqhyUqobnkTWSW5zY8JO/ol/UnKoJiWNC2w+WgrlcWOzCwEyYgJVBjEqM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V54g8xYb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V54g8xYb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08f9d0ef3so289078285a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 03 Mar 2025 23:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741075186; x=1741679986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aV334ikN5dUEF1FAOBcx+MylSK4OZXxof9bYGpg/Ok=;
        b=V54g8xYbewXnBgf9B5W24Tdo7TSA1Pmlp4uwTwLVl2/vLf5AiO4VDedgAIjpnz3RyK
         l7KYOLI/cJJXttu0WRdoSyMNvlca/jEbSKvIh09ZcT8KK75tzVWH9OPpdEo+OGlZvDDf
         9bbk8oMq7Y92JerWhhRk5fMWV+9p/Rg6sZEVdRh5iB6BCj5nkQ52nsuMIy/r0yDvFlcp
         4vbH9sc9NRmxapkEc3e0LDFz8bPWS/JfZdMgYpf4MANrHEKbOtvJeOhv097eoyFazTAr
         XAmLbxoJN5SRWwBJmgIjTH7IXogUia7Zt+Lmoghg8xKrAfxUeZZieMwPoP/UJEFGAV15
         vebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075186; x=1741679986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aV334ikN5dUEF1FAOBcx+MylSK4OZXxof9bYGpg/Ok=;
        b=GDhTc+TSXNQI1rEcWmRKYChhDZMEL/PPqS8b4u0YMocyMFnc0lmi0V7AtkUc2p6wN9
         0nwa80oeDDmH0zWi+J9UHc0A5CThT+wc5hF2QYBPVW8V6mjQ+Oi7YucNWACRyrkmfZZR
         B2fpqW+gojNgmlUz7VouH0q/b3pNTsU+etvm8kRb2nSnY4a4zlhE/nBC6bvTQSXwlvjU
         leB3u1IIPSU6VJLGwzv2zRrsyK7WrbkBfvqqcafpQI5nXmJYdg1mOzwIsPuUR8rD1Hup
         Xp1T34KPDGNQrBT9+uu/4jc7YmsKqrtwDw3aDP2AGl56lsO6TmyVIQyV+kMIw1lckFfq
         SOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsJEMG/vPra8HM6q/NmGc+L+kQNF5qiJXIu6jargEg1BTgJYhzeg3j2cf4JM+B1dbKFn6LgA58S/oWyGPeiXGlcgOceg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoxodlgDA5jmuIjf6GqRHku3ryX05VRYzh20MRRotzFKTHL/jp
	Wub+spb1+QU3C2/VT2jI1ktULq6XLAIiyJcU5qyyvz4SEJf502Yy
X-Gm-Gg: ASbGncvaI5pQeti6mu6RbJwMqQ87226kfiYvAnxWbgZd1cG7dC6XOdmisTujUbr7Bym
	tGGaCDbIGgAerLV4bHTo6lCm/98lbdsGa2jFAY2R3tiLOBa9pijP0S7cbXLtyNxFwfBQTTQJMb2
	7o2e6Mg3kFVL4/0yuiBmkbwWumApzkO6BJ8Je6gNThepjwWMxhCMxTmV0uYXAzjKSATPgDgTfBo
	XDteRTx0HKrHot/PzxlNX9KI1Jd3MMtWe2gLmWekGWiGlMOUOLNpSzHNoXG1yRtizs0boSyGQht
	v9Cmo9cSkcSGPfjj3fBig08nRSXrmS8F666onxUm6MpRJg==
X-Google-Smtp-Source: AGHT+IHIYoa+cieyOOJgxd5EL3wyq699sPw+C+GlH+7h85SoD+RTkabVF3VG6HjUXFBPykg/6gEcuA==
X-Received: by 2002:a05:622a:20a:b0:471:8d66:cd68 with SMTP id d75a77b69052e-474bc0554ddmr212901451cf.3.1741075185773;
        Mon, 03 Mar 2025 23:59:45 -0800 (PST)
Received: from iman-pc.home ([184.148.73.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474691a1f02sm70183901cf.11.2025.03.03.23.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:59:45 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: jack@suse.cz,
	amir73il@gmail.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] inotify: disallow watches on unsupported filesystems
Date: Tue,  4 Mar 2025 03:00:44 -0500
Message-ID: <20250304080044.7623-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

currently, inotify_add_watch() allows adding watches on filesystems
where inotify does not work correctly, without returning an explicit
error. This behavior is misleading and can cause confusion for users
expecting inotify to work on a certain filesystem.

This patch explicitly rejects inotify usage on filesystems where it
is known to be unreliable, such as sysfs, procfs, overlayfs, 9p, fuse,
and others.

By returning -EOPNOTSUPP, the limitation is made explicit, preventing
users from making incorrect assumptions about inotify behavior.

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 fs/notify/inotify/inotify_user.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index b372fb2c56bd..9b96438f4d46 100644
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@ -87,6 +87,13 @@ static const struct ctl_table inotify_table[] = {
 	},
 };
 
+static const unsigned long unwatchable_fs[] = {
+	PROC_SUPER_MAGIC,      SYSFS_MAGIC,	  TRACEFS_MAGIC,
+	DEBUGFS_MAGIC,	      CGROUP_SUPER_MAGIC, SECURITYFS_MAGIC,
+	RAMFS_MAGIC,	      DEVPTS_SUPER_MAGIC, BPF_FS_MAGIC,
+	OVERLAYFS_SUPER_MAGIC, FUSE_SUPER_MAGIC,   NFS_SUPER_MAGIC
+};
+
 static void __init inotify_sysctls_init(void)
 {
 	register_sysctl("fs/inotify", inotify_table);
@@ -690,6 +697,14 @@ static struct fsnotify_group *inotify_new_group(unsigned int max_events)
 }
 
 
+static inline bool is_unwatchable_fs(struct inode *inode)
+{
+	for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
+		if (inode->i_sb->s_magic == unwatchable_fs[i])
+			return true;
+	return false;
+}
+
 /* inotify syscalls */
 static int do_inotify_init(int flags)
 {
@@ -777,6 +792,13 @@ SYSCALL_DEFINE3(inotify_add_watch, int, fd, const char __user *, pathname,
 	inode = path.dentry->d_inode;
 	group = fd_file(f)->private_data;
 
+	/* ensure that inotify is only used on supported filesystems */
+	if (is_unwatchable_fs(inode)) {
+		pr_debug("%s: inotify is not supported on filesystem with s_magic=0x%lx\n",
+				__func__, inode->i_sb->s_magic);
+		return -EOPNOTSUPP;
+	}
+
 	/* create/update an inode mark */
 	ret = inotify_update_watch(group, inode, mask);
 	path_put(&path);
-- 
2.48.1

