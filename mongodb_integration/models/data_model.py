def create_transaction_document(row):
    return {
        "timestamp": row["Time Stamp"],
        "device_id": row["Id"],
        "serial_number": row["Serial Number"],
        "completed": row["Transaction Completed"],
        "matched": row["Matched"],
        "vehicle_class": row["Claimed Vehicle Class"],
        "manufacturer_id": row["Manufacturer Id"],
        "provider": row["Contract Provider"],
        "black_flag": row["Obe Black Flag"]
    }

def create_passage_document(row):
    return {
        "vehicle_class": row["Vehicle Class"],
        "event_class": row["Event Class"],
        "front_state_code": row["Front State Code"],
        "rear_state_code": row["Rear State Code"],
        "fusion_confidence": row["Fusion LPN Confidence"],
        "transaction_id": row["Transaction 1 ID"]
    }

