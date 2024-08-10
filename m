Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAC155A32
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723283044; cv=none; b=uwIjrYG5GrRTZAuXdT87AvA04VqLOAzmlcn372FEUuOeFy7t67pjSnaPoF8ASiAK4hFRcXvMuWfiXiv1eCtYVqMIPTrY4V24fAId+99s/CHPKwO01XU4H3KFSZDadTxTfenCVdCwH7TAtIHgwUfBwBroI+N3iFAn0eJ3JccvlxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723283044; c=relaxed/simple;
	bh=qqi7ZOwKwDTZ9Llrm0dom3gS+Cs5uBd+VaD8C+rprgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DYkS0svRgE+pwgft+Rxq9GBwCz11H5A/bgvYkJ5jIEHBjWqbMO6Q9rQUcT1b8f1skA1MkGbr8pwhoT+mhcap/b8yi4FYNIuhSK6gb22m1DC9omvHCXcnVqis/uurQ0Rx5YHXGveWm1uvFnxe7AYWq1SHpc5J08DeTDQHWqTR7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0Zzqqdo; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0Zzqqdo"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D2234042A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 09:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArmgKUUgFL9Q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Aug 2024 09:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D08E140141
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08E140141
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z0Zzqqdo
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D08E140141
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 09:43:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42816ca782dso20717595e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723283036; x=1723887836; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9lK3KNADF1A/NIXMtd/ommJFQkgG7/HTW72cQ/zXCQo=;
        b=Z0ZzqqdoYT8dNaSpHjNo9gtzJEjL/r0AX3LiwXVrLJVoBBOS1AiBiksHaTrEmf1TCF
         u0o4N/qTJLhSzmLUYH2iJIcLmKF5jfRrFBnjAsTYxTRZJPlsLTuENyAOjhhPTBaZ7hx9
         O+AbkpDE6DBaoNmxwojgRBAiJDUCpeyPfWs9kJVG++2gnhQk4ahcGyKyIMon7EXOWaS0
         SVQQDpMezOcDx/hZstjIOjWj8TOsyueWCeJR/VVsm004R7bI6nay3Rz5Wh0L6C7vmOp1
         Ny0o661Qg48hlRBJUWnSNsuC3CXPRJJ/fcSoUAd8em22fJ3f0wwT5lGQCSD85xaJJyKw
         r5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723283036; x=1723887836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lK3KNADF1A/NIXMtd/ommJFQkgG7/HTW72cQ/zXCQo=;
        b=oJUtTNrifsjjd/V2Z7UvvUHfL+/PvHQhr3dW1cIduYAhS9jiTiHSbJ2+JgbNZRLMlV
         70a2vnvqOWtwdP7RCyEKReo0H8dREil5zVlZxpfgQ7bBwBKxHb3Gk7fbTuHELIiR8ri9
         Domk+Zcg2poMUBYeBBbidgz3CfvntiChTN6Qbj8J/hUyDREc0s2BJd5uHg/xDm8OCUrm
         g4cwiNvUeVplAA/DNfx7pmDjFBsCRDRDuACurqVD/vJUovIJ6uE5Rns5r4E/50NQYXLr
         2nIUz0GXKD0r2/3nkErler/gcT7qud3uLjgRljAV3rMoG0QYR6Jd0qvXwPjYNEmt16pA
         zieg==
X-Forwarded-Encrypted: i=1; AJvYcCVSCizj04NXrYgCpZUdU9gLGBWJizsfLul/58216e0HmV0CPPIIYgtN2lal/xn4BODP/URLtBijy76LwWovjZmPzzfCK8jODQmAsVWFHcfhwGMOaH7ESWy2f6dDJQKp
X-Gm-Message-State: AOJu0YzUOdoICaP7hqG5gfDe/R4oEc+oEk0JrfT5F7RiN3xWsS0q8Ioh
	K0M52cBm9l8GyhhGTTjNC2MON4vP+yL8d1R5BAjBk/dpdB0iLeqg
X-Google-Smtp-Source: AGHT+IE06kbupzMLYw8kuT9Ee/44ffgb7AjxSqU1c58oKTHHBOjsu555g5BH3E9BJI2LdYC/3oF1fQ==
X-Received: by 2002:a05:600c:568f:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-429c3a52c4cmr29731335e9.28.1723283035422;
        Sat, 10 Aug 2024 02:43:55 -0700 (PDT)
Received: from laptop.. (117.red-83-52-251.dynamicip.rima-tde.net. [83.52.251.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c9ca1067sm8749065e9.1.2024.08.10.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 02:43:55 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH] Translation to spanish of the documentation related to EEVDF
Date: Sat, 10 Aug 2024 11:43:47 +0200
Message-Id: <20240810094348.13745-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
---
 .../translations/sp_SP/scheduler/index.rst    |  1 +
 .../sp_SP/scheduler/sched-design-CFS.rst      |  8 +--
 .../sp_SP/scheduler/sched-eevdf.rst           | 59 +++++++++++++++++++
 3 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/sp_SP/scheduler/sched-eevdf.rst

diff --git a/Documentation/translations/sp_SP/scheduler/index.rst b/Documentation/translations/sp_SP/scheduler/index.rst
index 768488d6f001..32f9fd7517b2 100644
--- a/Documentation/translations/sp_SP/scheduler/index.rst
+++ b/Documentation/translations/sp_SP/scheduler/index.rst
@@ -6,3 +6,4 @@
     :maxdepth: 1
 
     sched-design-CFS
+    sched-eevdf
diff --git a/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
index 90a153cad4e8..8b8eb581c7be 100644
--- a/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
+++ b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
@@ -14,10 +14,10 @@ Gestor de tareas CFS
 
 CFS viene de las siglas en inglés de "Gestor de tareas totalmente justo"
 ("Completely Fair Scheduler"), y es el nuevo gestor de tareas de escritorio
-implementado por Ingo Molnar e integrado en Linux 2.6.23. Es el sustituto de
-el previo gestor de tareas SCHED_OTHER.
-
-Nota: El planificador EEVDF fue incorporado más recientemente al kernel.
+implementado por Ingo Molnar e integrado en Linux 2.6.23. Es el sustituto
+del previo gestor de tareas SCHED_OTHER. Hoy en día se está abriendo camino
+para el gestor de tareas EEVDF cuya documentación se puede ver en
+Documentation/scheduler/sched-eevdf.rst
 
 El 80% del diseño de CFS puede ser resumido en una única frase: CFS
 básicamente modela una "CPU ideal, precisa y multi-tarea" sobre hardware
diff --git a/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst b/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst
new file mode 100644
index 000000000000..b49e202bf79a
--- /dev/null
+++ b/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst
@@ -0,0 +1,59 @@
+
+.. include:: ../disclaimer-sp.rst
+
+:Original: :ref:`Documentation/scheduler/sched-eevdf.rst <sched_eevdf>`
+:Translator: Sergio González Collado <sergio.collado@gmail.com>
+
+======================
+Gestor de tareas EEVDF
+======================
+
+El gestor de tareas EEVDF,del inglés: "Earliest Eligible Virtual Deadline
+First", fue presentado por primera vez en una publicación científica en
+1995 [1]. El kernel de Linux comenzó a transicionar hacia EEVPF en la
+versión 6.6 (y como una nueva opción en 2024), alejándose del gestor
+de tareas CFS, en favor de una versión de EEVDF propuesta por Peter
+Zijlstra en 2023 [2-4]. Más información relativa a CFS puede encontrarse
+en Documentation/scheduler/sched-design-CFS.rst.
+
+De forma parecida a CFS, EEVDF intenta distribuir el tiempo de ejecución
+de la CPU de forma equitativa entre todas las tareas que tengan la misma
+prioridad y puedan ser ejecutables. Para eso, asigna un tiempo de
+ejecución virtual a cada tarea, creando un "retraso" que puede ser usado
+para determinar si una tarea ha recibido su cantidad justa de tiempo
+de ejecución en la CPU. De esta manera, una tarea con un "retraso"
+positivo, es porque se le debe tiempo de ejecución, mientras que una
+con "retraso" negativo implica que la tarea ha excedido su cuota de
+tiempo. EEVDF elige las tareas con un "retraso" mayor igual a cero y
+calcula un tiempo límite de ejecución virtual (VD, del inglés: virtual
+deadline) para cada una, eligiendo la tarea con la VD más próxima para
+ser ejecutada a continuación. Es importante darse cuenta que esto permite
+que la tareas que sean sensibles a la latencia que tengan porciones de
+tiempos de ejecución de CPU más cortos ser priorizadas, lo cual ayuda con
+su menor tiempo de respuesta.
+
+Ahora mismo se está discutiendo cómo gestionar esos "retrasos", especialmente
+en tareas que estén en un estado durmiente; pero en el momento en el que
+se escribe este texto EEVDF usa un mecanismo de "decaimiento" basado en el
+tiempo virtual de ejecución (VRT, del inglés: virtual run time). Esto previene
+a las tareas de abusar del sistema simplemente durmiendo brevemente para
+reajustar su retraso negativo: cuando una tarea duerme, esta permanece en
+la cola de ejecución pero marcada para "desencolado diferido", permitiendo
+a su retraso decaer a lo largo de VRT. Por tanto, las tareas que duerman
+por más tiempo eventualmente eliminarán su retraso. Finalmente, las tareas
+pueden adelantarse a otras si su VD es más próximo el tiempo, y las
+tareas podrán pedir porciones de tiempo específicas con la nueva llamada
+del sistema sched_setattr(), todo esto facilitara el trabajo en las aplicaciones
+que sean sensibles a las latencias.
+
+REFERENCIAS
+===========
+
+[1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
+
+[2] https://lore.kernel.org/lkml/a79014e6-ea83-b316-1e12-2ae056bda6fa@linux.vnet.ibm.com/
+
+[3] https://lwn.net/Articles/969062/
+
+[4] https://lwn.net/Articles/925371/
+
-- 
2.39.2

