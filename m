Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B959F156673
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724493272; cv=none; b=hMImXimy8+7bDO+AaNCcbLMZXVGMjrOpTTBg49tGZAdvXxAmmf9tp9qOUPTmjAVcfI6lFzI1lmg3bamEPT1WT9atYxO07X/mrDwMPexGFT4iUAoGfRXK/8k8Wu/P36UnHT6zfcUq8DaS5qjkdoTqliRRUTvGAAgUzyyp9MaRQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724493272; c=relaxed/simple;
	bh=RT4PAz5DWmaRViU89CTu1N1YNxLCpcJ/9YgA8TxWqsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LV+SvCzIJ+rGVZM+SCpnATarBRLwMh64hRyjn44h9VLoq2DndB5UVNhMkXfxWuW4DBksI83+ijNG+6AYPv48Db2LHxOHlhgiJ9h4vJExcR5rzt2tCrXfN7tq2aEovEAh4Fa2AFGpnj8YTw53Sn9SiMjjIJ4wX0d8uDPyXYUm//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOQRdmBW; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOQRdmBW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A688381A65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 09:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWvYEQb04e4l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 09:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 407E681A58
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407E681A58
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MOQRdmBW
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 407E681A58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 09:54:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42809d6e719so22144465e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724493265; x=1725098065; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl/9QirrjmP00deE5lv+kl0ShCaSSoObNFIAo4Gu3To=;
        b=MOQRdmBWNWqx3muySH/Fet8nDOMOp6EXG15gpvl1UUIKVpz21mg2hw5sPchoYbJ0Sj
         pt07m4flnRxBIAfmTv3Uvwm6pnBtI0owF7MJFNhlm3DCJYi3FlemDjl2Gr2Az8mUIjct
         UKk+hj2mKi1MSh3u8/c/sEUSbK0q2TD1s7it0UBrOTxakDZRAzYjXkovVvKdgUKMJzJZ
         sjF8jGnk9o2ZVd+M1lv6TctI5aFNFzk424LjXeQHNGjmNH0rKwzTCIsQFvmhNrBrWz8k
         y22oI01WeOJ6Bp1yPfZAcmWXUeKGNXKuWwUfMtqKNpXDg8mZPWShZrlFrgV1Co9AkUCs
         +k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724493265; x=1725098065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl/9QirrjmP00deE5lv+kl0ShCaSSoObNFIAo4Gu3To=;
        b=GmoFwy33rXcwRHMxpDuQosZfr/uTvLgMVHQ27EgZ9Rb1Wzl41YCGH6LbrL/cmJi7Ki
         5TGTnYvVJejO1szqeUpwnKg/Ikttz5dJ9dcHy2CDm2WxOxybFf1654rHKqEDfumLiORX
         RHWxTZoR/FqUu0ZAUmEDsql7qszBQqtzKx0hPpbymkHoXhg8b6s4V+UUH1u+XTdFuxMT
         mJlOS3eb9ehOovGZcc8O/WbU0Sh246aKZfSfO7gsZJeWPdAqiT1+YJSQzJ6d4xPnb+Mc
         c5PgvesMNyfFDRdRJc6uLCn64AMJ+gVEEUqZB1wLLrOCHLnfX8hxh8FHalf/FdPPljh1
         MT9A==
X-Forwarded-Encrypted: i=1; AJvYcCXPSMQ+UmnhS94RNUklBEBJJIuf5tllOS2qmGeLiEOZ0g8d67Jpyk+D2fYs90piXFZ3RpnzjqVvfkqEFe33zKiSgVRRCg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw6Sux+Vy6QFh6DNV3jtU4Ws0pWMSO9562AZJwHUcHGOYyFj5Zo
	vYmp2FTBT/AsQhjq944Fp77Mjm2zzdWN1aR9yxqvaVJY+yfdQ2ql
X-Google-Smtp-Source: AGHT+IFRBpRoo9NzkrEOMC5wz2Y+CDpAv1yqEHwHk3FGELvA1ToIzfhxpzwo9RcN9I0LUqwTL2xUZQ==
X-Received: by 2002:a05:600c:4453:b0:426:4978:65f0 with SMTP id 5b1f17b1804b1-42acc8dd846mr37021305e9.18.1724493264101;
        Sat, 24 Aug 2024 02:54:24 -0700 (PDT)
Received: from laptop.. (117.red-83-52-251.dynamicip.rima-tde.net. [83.52.251.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefc626fsm126301265e9.31.2024.08.24.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 02:54:23 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH v3] docs/sp_Sp: Add translation to spanish of the documentation related to EEVDF
Date: Sat, 24 Aug 2024 11:54:02 +0200
Message-Id: <20240824095402.7706-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/scheduler/sched-eevdf.rst to Spanish.

Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
---
 v1 -> v2: corrected the commit message
---
 v2 -> v3: corrected typos
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
index 90a153cad4e8..c146e5bba881 100644
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
+para el gestor de tareas EEVDF, cuya documentación se puede ver en
+Documentation/scheduler/sched-eevdf.rst
 
 El 80% del diseño de CFS puede ser resumido en una única frase: CFS
 básicamente modela una "CPU ideal, precisa y multi-tarea" sobre hardware
diff --git a/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst b/Documentation/translations/sp_SP/scheduler/sched-eevdf.rst
new file mode 100644
index 000000000000..786f7e6637e4
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
+El gestor de tareas EEVDF, del inglés: "Earliest Eligible Virtual Deadline
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
+pueden adelantarse a otras si su VD es más próximo en el tiempo, y las
+tareas podrán pedir porciones de tiempo específicas con la nueva llamada
+del sistema sched_setattr(), todo esto facilitara el trabajo de las aplicaciones
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

