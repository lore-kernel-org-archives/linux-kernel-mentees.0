Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EE1581EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723288554; cv=none; b=a4uZULMXh7FeaYV07rGe42D1gDdf5oFCTC6Mo5GGZinq5s9lJkKmL73mI9lbBNuGjUr/y5ALfkp4Ym/orwFKB/lsfMhwjI6ZzQ1/brlYpkV5lsGPBGsHt+dHOgIYMiwDHyZMPETFYqIWMIlY7wCE2wZe2d4KQkELyEKg8Xa2IVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723288554; c=relaxed/simple;
	bh=0kv0r7M0u9YFyPFmqEmX+BMvA+T7MYkAoNKr0znLjTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DZG/+3/W7RjFNHs2ZjIcwDa0SW6oyJiidO5tODaS9B2gXofAcNWSrOzT0CFjeEfXTAgvPW9Y1VGuGd5g11lgjjDEhEKyXxVKjz5u4lB2yXylttmzdbYnRO6tzzIu03whBiLLbR2DKvpQbVTNo10gOxQ3qwrySpXFS1ZWvOwiY4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+ygiRMD; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+ygiRMD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E528C4139A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 11:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr21rpq7B3CR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Aug 2024 11:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6499A4136F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6499A4136F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+ygiRMD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6499A4136F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 11:15:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42808071810so21245905e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723288548; x=1723893348; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnQ+KfMwxGUG7PiqOtodLq5r046+Ih8B8xbS6UwetXI=;
        b=m+ygiRMDg+7TpQRNMo68LEWSi36uB0jV7JROobUOTsVHSJhSByyGuab1oVB1C0r7v2
         fVhv433swQ9pdtoowCQNjAiCJW7xhSHtL6Vqbhb5O2jFXAUJqkQAqrjVsANSL2ZrtUJg
         RKVGDkM5I/VuRtwVvRh/0opeXhPTHmfZEENjXSlReRPvwfPTXlMB2oUVM3/B8jZzZt0t
         SYWmC6qPXG9AWl/Ugi0Omzcfz+/NKcWjE0VOlhwPdjqqjRkingea69/IU4LKJ46K7NN0
         qyz2ei7aZZr59SuF1u/QTShzXR7ZDaQNb8jILslEic7DY5hCcdgsFRRJ4Tkyv1myJMMC
         FBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723288548; x=1723893348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnQ+KfMwxGUG7PiqOtodLq5r046+Ih8B8xbS6UwetXI=;
        b=iAL7vVUQB1uuSstpYnJpEeuXrLRJGnXp1UWdPv5YLEhrv80v9MgkgcR7gbQ8D7ilOr
         XgrVjrIbuJD00vbHKcQfKulGFascnsFS/TZvzMVU/rcI6j7SwHYK/3oCKaYgaE/jzsNb
         vdw2LkGvWGLRKI4YzCD9bAtMrdFQATVRnnpyWkX7BfRug/XdP1PuVIJUAJTJYmeH7sxG
         M5zkgc2a5nqdlrO4Xjh02OK0bc91b+of/NIS7TwP/WP3aVt37mS2xCxU+zMUc/wpXHm8
         kAU1w/TfdKEZlMxsbH7n53ImDsfigDIyPpM/VoknWY9l3OGX6LDKCbYEWALSC6SSBU+r
         RemA==
X-Forwarded-Encrypted: i=1; AJvYcCUmvm+2qt1NhQxJFVxG3DeVzwFd2PO2USGAizztzsaDGrTP4ahddXtkN0IpAiL6xWqv2SHpZEIp1WkZ2y5qUH6ZzV4OBV3dOJ+oUn7OyPYvKBjxyA9BDNIejlqL7vQ/
X-Gm-Message-State: AOJu0YzMjRoHQurL2UYCJo/wsmJHmBKeOuqJyL8Phd/O/+/nSde7FLvE
	zb3AUi3Ga6hhh57BJVPaI9SqKU4n9HbEK1LrA+Ch1ltt9OzbSQ//uT2jQGnR
X-Google-Smtp-Source: AGHT+IG/S5dBAVx5hOYBmsbAVXWyTT7ET+S2Xzwyd00AYBry/qByg5G7vocddhGT0j+kHi8CHSsQvQ==
X-Received: by 2002:a05:600c:3584:b0:428:fb7f:c831 with SMTP id 5b1f17b1804b1-429c3a5821amr34249335e9.32.1723288547759;
        Sat, 10 Aug 2024 04:15:47 -0700 (PDT)
Received: from laptop.. (117.red-83-52-251.dynamicip.rima-tde.net. [83.52.251.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c74ffd55sm26155245e9.4.2024.08.10.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 04:15:46 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH v2] docs/sp_Sp: Add translation to spanish of the documentation related to EEVDF
Date: Sat, 10 Aug 2024 13:15:13 +0200
Message-Id: <20240810111513.20049-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/scheduler/sched-eevdf.rst to spanish.

Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
---
 v1 -> v2: correct the commit message.
---
 .../translations/sp_SP/scheduler/index.rst    |  1 +
 .../sp_SP/scheduler/sched-design-CFS.rst      |  8 +--
 .../sp_SP/scheduler/sched-eevdf.rst           | 58 +++++++++++++++++++
 3 files changed, 63 insertions(+), 4 deletions(-)
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
index 000000000000..54f68473f31a
--- /dev/null
+++ b/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst
@@ -0,0 +1,58 @@
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
-- 
2.39.2

